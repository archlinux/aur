# Maintainer: Wynne Plaga <rwplaga dot linux at gmail dot com>

pkgname=g-desktop-suite-git
_reponame=G-Desktop-Suite
pkgver=139.2bccd4c
pkgrel=1
pkgdesc="Google Suite as a desktop app. Made possible with Electron."
arch=('any')
url="https://github.com/alexkim205/G-Desktop-Suite"
license=('MIT')
depends=('yarn')
makedepends=('git' 'tar' 'xz')
source=("git+https://github.com/alexkim205/G-Desktop-Suite.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_reponame"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_reponame"

    yarn install
    yarn electron-builder -l pacman
    cd dist
    mv gdesktopsuite-*.pacman gdesktopsuite.tar.xz
}

package() {
    cd "$srcdir/$_reponame/dist"

    tar -xJf gdesktopsuite.tar.xz -C "$pkgdir"
    cd $pkgdir
    rm .[^.]*
}

