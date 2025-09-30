#
# PKGBUILD for minipro-gui
#
# Maintainer: Uffe Jakobsen: uffe _.at._ uffe _.dot._ org
#
pkgname=minipro-gui
_pkgname=minipro-gui
pkgver=0.1
pkg_name_ver="${pkgname}-${pkgver}"
pkgrel=1
pkgdesc="MiniPro GUI wrapper for MiniPro CLI "
arch=("x86_64")
url="https://github.com/twelve-chairs/minipro-gui"
license=("Unlicense")
depends=("qt6-base" "gcc-libs" "minipro")
makedepends=("cmake")
provides=("minipro-gui")
conflicts=("minipro-gui")
source=("https://github.com/twelve-chairs/minipro-gui/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("9653dbb85266e7478858ad120dc15177a833fda10877e620e509a7a7a0cb4028")

#pkgver()
#{
#  cd "${srcdir}/${pkg_name_ver}"
#	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

prepare()
{
  cd "${srcdir}/${pkg_name_ver}"
}

build()
{
	cd "${srcdir}/${pkg_name_ver}"
  cmake -S . -B _build.out -DCMAKE_BUILD_TYPE=MinSizeRel
  cmake --build _build.out
}

check()
{
	cd "${srcdir}/${pkg_name_ver}/tests"

  cmake -S . -B .
  cmake --build .

  ./minipro-gui
}

package()
{
	cd "${srcdir}/${pkg_name_ver}"
  #cmake --install _build.out --prefix "${pkgdir}"
	install -D -m 0755 _build.out/minipro-gui "${pkgdir}/usr/bin/minipro-gui"
	install -D -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
