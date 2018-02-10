# Maintainer: Dusan Baran <work.dusanbaran@gmail.com>

pkgname=dam-git
pkgver=1771439
pkgrel=4
pkgdesc="DAM git"
arch=('any')
url="https://github.com/dudoslav/dam"
licence=('GPL3')
depends=('git' 'pacman' 'ruby' 'ruby-bundler')
source=("git+https://github.com/dudoslav/dam.git" "dam.service")
sha256sums=('SKIP'
            'caddf94924deec8ad04f1434631805cc9c4e360b75b70d5fd14c272e08fb7894')

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
    chmod -R 644 "$pkgdir/usr/lib/dam"
    install -m 644 -D dam.service "$pkgdir/usr/lib/systemd/system/dam.service"
}
