# Maintainer: Dominik Kummer <admin@arkades.org>

pkgname='pacaur-git'
_pkgname="${pkgname/-git}"
pkgver=4.8.6.48.g0b63eda
pkgrel=2
pkgdesc='An AUR helper that minimizes user interaction'
arch=('any')
url="https://gitlab.com/arkadesOrg/${_pkgname}"
license=('ISC')
depends=('auracle-git' 'expac' 'sudo' 'git' 'jq')
makedepends=('perl' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("etc/xdg/${_pkgname}/config")
source=("git+https://gitlab.com/arkadesOrg/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    git -C "${srcdir}/${_pkgname}" describe --always | sed 's%-%.%g'
}

package() {
    make -C "${srcdir}/${_pkgname}" DESTDIR="${pkgdir}" PREFIX='/usr' install
    sed -i "s%version=\"[0-9].[0-9].[0-9]*\"%version=\"${pkgver}\"%g" "${pkgdir}/usr/bin/${_pkgname}"
}

