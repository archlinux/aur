# Maintainer: Steven Allen <steven@stebalien.com>
# COntributor: Ferk <ferkiwi at gmail.com>
# Contributor: Shizeeque Unadequatov <shizeeque@gmail.com>

pkgname=imlib2-webp-git
_gitname=imlib2-webp
pkgver=20131017
pkgrel=1
pkgdesc='A WebP loader for Imlib2. Enables WebP support for every application that uses the imlib2 library.'
arch=('i686' 'x86_64')
url='http://www.hauweele.net/~gawen/imlib2-webp.html'
license=('BSD')
depends=('imlib2' 'libwebp')
makedepends=('git')
provides=('imlib2-webp')
conflicts=('imlib2-webp')

source=('imlib2-webp::git+https://github.com/gawen947/imlib2-webp.git')

md5sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    echo $(git log -1 --date=short --format='%cd' | sed 's/-//g')
}

build() {
    cd "${_gitname}"
    make
}

package() {
    cd "${_gitname}"

    make DESTDIR="${pkgdir}" install
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim: set ts=4 sw=4 et:
