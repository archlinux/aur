# Maintainer: Connor Etherington <connor@concise.cc>
# ---
_pkgname=BetterBin
pkgname=betterbin
pkgver=1.0.54
pkgrel=1
pkgdesc='A number of useful shell scripts to increace productivity and speed up your workflow'
arch=(x86_64)
url="https://gitlab.com/qYp/${pkgname}"
license=('MIT')
depends=()
makedepends=(git)                 
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "1.0.""$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${pkgname}
  rm -rf ${pkgdir}/usr/bin/{"$(ls -1 ${srcdir}/${pkgname}/opt/${_pkgname})"}
  mkdir -p "${pkgdir}/usr/bin" ; mkdir -p "${pkgdir}/opt/${_pkgname}"
  install -Dm775 opt/${_pkgname}/* -g wheel -o ${USER} -t "${pkgdir}/opt/${_pkgname}"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for pkg in $(ls -1 ${srcdir}/${pkgname}/opt/${_pkgname}) ; do
    ln -sf "${pkgdir}/opt/${_pkgname}/${pkg}" "${pkgdir}/usr/bin/"
  done
}
