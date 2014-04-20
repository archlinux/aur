# Maintainer: schalox <schalox at gmail dot com>
# Contributor: Simon Zimmermann <simon@insmo.com>

pkgname=pass-git
pkgver=20140419.220
pkgrel=1
pkgdesc='Stores, retrieves, generates, and synchronizes passwords securely'
url='http://zx2c4.com/projects/password-store/'
license='GPL2'
arch=('any')
depends=('xclip' 'bash' 'git' 'gnupg' 'pwgen' 'tree')
makedepends=('git')
provides=('pass')
conflicts=('pass')
source=("$pkgname::git://git.zx2c4.com/password-store"
        'Makefile.patch')
sha256sums=('SKIP'
            'e29a3a32ee051a7c164e100c433b25a6e7532388d4060bf70e57f73d92676bb9')

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
