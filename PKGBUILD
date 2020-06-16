# Maintainer: Frank Carlyle McLaughlin (frankspace) <frank@frankspace.com>

pkgname=openimagedenoise-bin
_pkgname=oidn
pkgver=1.2.1
pkgrel=1
pkgdesc='Intel(R) Open Image Denoise library, official binaries'
arch=('x86_64')
url='https://openimagedenoise.github.io'
license=('Apache')
depends=('intel-tbb')
source=("https://github.com/OpenImageDenoise/oidn/releases/download/v${pkgver}/oidn-${pkgver}.x86_64.linux.tar.gz")
conflicts=("openimagedenoise")
provides=("openimagedenoise")
sha256sums=("18ff3ce92c15261db0efcd05410a6db481adf45020ec8b56540f9f6d28e7fb88")

# REASON FOR THE EXISTENCE OF THIS PACKAGE:
# The Arch package fails on my older CPU, but the official binaries work.
# See:
#   https://bugs.archlinux.org/task/66779
#   https://github.com/OpenImageDenoise/oidn/issues/76

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}.x86_64.linux"

  mkdir -p "${pkgdir}/usr"

  install -D -m755 bin/oidnBenchmark "${pkgdir}/usr/bin/oidnBenchmark"
  install -D -m755 bin/oidnDenoise "${pkgdir}/usr/bin/oidnDenoise"
  install -D -m755 bin/oidnTest "${pkgdir}/usr/bin/oidnTest"
  install -d "${pkgdir}/usr/share/doc/OpenImageDenoise"
  install -D -m644 doc/* "${pkgdir}/usr/share/doc/OpenImageDenoise"
  install -d "${pkgdir}/usr/include/OpenImageDenoise"
  install -D -m644 include/OpenImageDenoise/* "${pkgdir}/usr/include/OpenImageDenoise"
  install -d "${pkgdir}/usr/lib"
  install -D -m644 lib/*.* "${pkgdir}/usr/lib"
  install -d "${pkgdir}/usr/lib/cmake/OpenImageDenoise"
  install -D -m644 lib/cmake/OpenImageDenoise/* "${pkgdir}/usr/lib/cmake/OpenImageDenoise"

  ln -sf /usr/lib/libOpenImageDenoise.so.0 ${pkgdir}/usr/lib/libOpenImageDenoise.so
  ln -sf /usr/lib/libOpenImageDenoise.so.${pkgver} ${pkgdir}/usr/lib/libOpenImageDenoise.so.0

#   these are already provided by intel-tbb
  rm ${pkgdir}/usr/lib/libtbb.so.2
  rm ${pkgdir}/usr/lib/libtbbmalloc.so.2

}
