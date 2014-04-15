# Maintainer: schalox <schalox at gmail dot com>
# Contributor: Simon Zimmermann <simon@insmo.com>

pkgname=pass-git
pkgver=20140415.191
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
            '00d90c0406e881783491f1f160ce1ff7f1b856179f1af299f92fc919f7ec8ba7')

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
