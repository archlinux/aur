# Maintainer: schalox <schalox at gmail dot com>
# Contributor: Simon Zimmermann <simon@insmo.com>

pkgname=pass-git
pkgver=20140417.200
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
            'f64dfddc0c8e4469cb0f089cb4570f243400eb3fb4081dde51acbfe1f0fa7139')

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
