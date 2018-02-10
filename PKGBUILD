# Maintainer: Dusan Baran <work.dusanbaran@gmail.com>

pkgname=dam-git
pkgver=1771439
pkgrel=5
pkgdesc="DAM git"
arch=('any')
url="https://github.com/dudoslav/dam"
licence=('GPL3')
depends=('git' 'pacman' 'ruby' 'ruby-bundler')
source=("git+https://github.com/dudoslav/dam.git" "dam.service")
sha256sums=('SKIP'
            '2362417f9474830bf3d3f882b4fb9c639be9c6a1bba59191b683ad26be616c94')

pkgver() {
    cd dam
    git describe --always | sed -e 's|-|.|g'
}

build() {
    cd "$srcdir/dam"
    bundle install --deployment
}

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/lib"
    cp -R dam "$pkgdir/usr/lib"
    install -m 644 -D dam.service "$pkgdir/usr/lib/systemd/system/dam.service"
}
