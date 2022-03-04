# Maintainer: Connor Etherington <connor@concise.cc>
# ---
_pkgname=BetterBin
pkgname=betterbin
pkgver=1.0.r60
pkgrel=1
pkgdesc='Various useful shell scripts to increace productivity and speed up your workflow!'
arch=(x86_64)
url="https://gitlab.com/qYp/${pkgname}"
license=('MIT')
depends=()
makedepends=(git)                 
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "1.0.r""$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${pkgname}
  rm -rf ${pkgdir}/usr/bin/{"$(ls -1 ${srcdir}/${pkgname}/usr/bin/${_pkgname})"}
  mkdir -p "${pkgdir}/usr/bin" ; mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm775 usr/bin/* -g wheel -o ${USER} -t "${pkgdir}/usr/bin/"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
