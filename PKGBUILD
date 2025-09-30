#
# PKGBUILD for minipro-gui.git
#
# Maintainer: Uffe Jakobsen: uffe _.at._ uffe _.dot._ org
#
pkgname=minipro-gui-git
_pkgname=minipro-gui
pkgver=r176.9652183
pkgrel=1
pkgdesc="MiniPro GUI wrapper for MiniPro CLI "
arch=("x86_64")
url="https://github.com/twelve-chairs/minipro-gui"
license=("Unlicense")
depends=("qt6-base" "gcc-libs" "minipro")
makedepends=("cmake")
provides=("minipro-gui")
conflicts=("minipro-gui")
source=("git+https://github.com/twelve-chairs/minipro-gui.git")
sha256sums=("SKIP")

pkgver()
{
  #cd "${srcdir}/${_pkgname}-${_pkgver}"
  cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare()
{
  #cd "${srcdir}/${_pkgname}-${_pkgver}"
  cd "${srcdir}/${_pkgname}"
}

build()
{
	cd "${srcdir}/${_pkgname}"
  cmake -S . -B _build.out -DCMAKE_BUILD_TYPE=MinSizeRel
  cmake --build _build.out
}

check()
{
	cd "${srcdir}/${_pkgname}/tests"

  cmake -S . -B .
  cmake --build .

  ./minipro-gui
}

package()
{
	cd "${srcdir}/${_pkgname}"
  #cmake --install _build.out --prefix "${pkgdir}"
	install -D -m 0755 _build.out/minipro-gui "${pkgdir}/usr/bin/minipro-gui"
	install -D -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
