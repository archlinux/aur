#
# PKGBUILD for fireminipro-git
#
# Maintainer: Uffe Jakobsen: uffe _.at._ uffe _.dot._ org
#
pkgname=fireminipro-git
_pkgname=fireminipro
pkgver=r215.a735509
pkgrel=1
pkgdesc="MiniPro GUI wrapper for MiniPro CLI"
arch=("x86_64")
url="https://github.com/Jartza/fireminipro"
license=("MIT")
depends=("qt6-base" "gcc-libs" "minipro")
makedepends=("cmake")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+https://github.com/Jartza/fireminipro.git")
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
  #cd "${srcdir}/${_pkgname}-${_pkgver}"
	cd "${srcdir}/${_pkgname}"
  cmake -S . -B _build.out -DCMAKE_BUILD_TYPE=MinSizeRel
  cmake --build _build.out
}

check()
{
  #cd "${srcdir}/${_pkgname}-${_pkgver}"
	cd "${srcdir}/${_pkgname}"
}

package()
{
	cd "${srcdir}/${_pkgname}"
  cmake --install _build.out --prefix "${pkgdir}"
	install -D -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m 0755 _build.out/${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
