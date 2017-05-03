# Maintainer: Michaël Serpieri <mickybart@pygoscelis.org>

# needed to compil libhybris-git, qpa-qt-hwcomposer-plugin, ...

pkgname=hybris-android-headers
pkgver=5.1.1_30
pkgrel=1
pkgdesc="hybris - Android Headers from AOSP"
arch=('armv7h' 'x86_64')
url=""
license=('custom')
depends=()
options=('!strip')
install=''
source=('gls-common::git+https://github.com/mickybart/gnulinux_support-common')
md5sums=('SKIP')

prepare() {
  mkdir -p ${srcdir}/headers
  cd ${srcdir}/headers/
  bsdtar -xpf ${srcdir}/gls-common/aur-blob/${pkgname}/android-headers-${pkgver}.tgz
}

package() {
  cd "${srcdir}/headers"

  install -d "${pkgdir}/opt/android"

  make DESTDIR="$pkgdir/" PREFIX=/opt/android INCLUDEDIR=/opt/android/include PKGCONFIGDIR=/usr/lib/pkgconfig install
  sed -i 's|Cflags:.*|Cflags: -I${includedir}|' "${pkgdir}/usr/lib/pkgconfig/android-headers.pc"

}

