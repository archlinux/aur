pkgname='pacaur-git'
_pkgname="${pkgname/-git}"
pkgver=4.8.4.4.gd1064f3
pkgrel=1
pkgdesc='An AUR helper that minimizes user interaction'
arch=('any')
url="https://github.com/E5ten/${_pkgname}"
license=('ISC')
depends=('auracle-git' 'expac' 'sudo' 'git' 'jq')
makedepends=('perl' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("etc/xdg/${_pkgname}/config")
source=("git+https://github.com/E5ten/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    git -C "${srcdir}/${_pkgname}" describe --always | sed 's%-%.%g'
}

package() {
    make -C "${srcdir}/${_pkgname}" DESTDIR="${pkgdir}" PREFIX='/usr' install
    sed -i "s%version=\"[0-9].[0-9].[0-9]*\"%version=\"${pkgver}\"%g" "${pkgdir}/usr/bin/${_pkgname}"
}

