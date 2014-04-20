# Maintainer: schalox <schalox at gmail dot com>
# Contributor: Simon Zimmermann <simon@insmo.com>

pkgname=pass-git
pkgver=20140419.220
pkgrel=2
pkgdesc='Stores, retrieves, generates, and synchronizes passwords securely'
url='http://zx2c4.com/projects/password-store/'
license='GPL2'
arch=('any')
depends=('bash' 'git' 'gnupg' 'grep' 'pwgen' 'tree' 'xclip')
makedepends=('git')
provides=('pass')
conflicts=('pass')
source=("$pkgname::git://git.zx2c4.com/password-store"
        'Makefile.patch')
sha256sums=('SKIP'
            'be01e83ff15b928b9518e49365587012287533543d68c41c65bcbce78fbeb63c')

pkgver() {
    cd "$pkgname"
    local _tmpver="$(git log -n 1 --format="%cd" --date=short)."
    local _tmpver+="$(git rev-list --count HEAD)"
    echo "${_tmpver//-/}"
}
prepare() {
    cd "$pkgname"
    patch < "${srcdir}/Makefile.patch"
}
package() {
    cd "$pkgname"
    make DESTDIR="${pkgdir}" install
}
