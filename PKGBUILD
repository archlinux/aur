# Maintainer: schalox <schalox at gmail dot com>
# Contributor: Simon Zimmermann <simon@insmo.com>

pkgname=pass-git
pkgver=20140421.224
pkgrel=1
pkgdesc='Stores, retrieves, generates, and synchronizes passwords securely'
url='http://zx2c4.com/projects/password-store/'
license='GPL2'
arch=('any')
depends=('bash' 'git' 'gnupg' 'grep' 'pwgen' 'tree' 'xclip')
makedepends=('git')
provides=('pass')
conflicts=('pass')
source=("$pkgname::git://git.zx2c4.com/password-store")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    local _tmpver="$(git log -n 1 --format="%cd" --date=short)."
    local _tmpver+="$(git rev-list --count HEAD)"
    echo "${_tmpver//-/}"
}
package() {
    cd "$pkgname"
    make FORCE_BASHCOMP=1 \
         FORCE_ZSHCOMP=1 \
         FORCE_FISHCOMP=1 \
         DESTDIR="${pkgdir}" install
}
