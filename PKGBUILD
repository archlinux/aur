# Maintainer: schalox <schalox at gmail dot com>
# Contributor: Simon Zimmermann <simon@insmo.com>

pkgname=pass-git
pkgver=20130914.140
pkgrel=2
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
            'd3266ee9d64c2bb5a8517d00af777341f91c3d1f7a9a35d157f908838b086488')

pkgver() {
    cd "$pkgname"
    local _tmpver="$(git log -n 1 --format="%cd" --date=short)."
    local _tmpver+="$(git rev-list --count HEAD)"
    echo "${_tmpver//-/}"
}
prepare() {
    cd "$pkgname"
    patch -Np1 -i "${srcdir}/Makefile.patch"
}
package() {
    cd "$pkgname"

    make DESTDIR="${pkgdir}" install
    install -Dm0644 contrib/pass.zsh-completion "${pkgdir}/usr/share/zsh/site-functions/_pass"
}
