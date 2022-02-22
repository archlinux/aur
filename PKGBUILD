# Maintainer: Connor Etherington <connor@concise.cc>

_pkgname=BetterBin
_localdir=${HOME}/.local
pkgname=betterbin
pkgver=1.0.48
pkgrel=1
pkgdesc='A number of useful shell scripts making daily Linux work more efficient.'
arch=(x86_64)
url="https://gitlab.com/qYp/$pkgname"
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
    mkdir -p "${pkgdir}/${_localdir}"
    sudo sed -i "/.*${_pkgname}.*/d" /etc/profile
    sudo sed -i "/append_path '\/usr\/bin'/aappend_path '\/opt\/"${_pkgname}"'" /etc/profile
    install -Dm776 opt/${_pkgname}/* -g wheel -o ${USER} -t "${pkgdir}/opt/${_pkgname}"
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    ln -sf ${pkdir}/opt/${_pkgname} "${pkgdir}${_localdir}/${_pkgname}"
}
