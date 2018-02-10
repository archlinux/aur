# Maintainer: Dusan Baran <work.dusanbaran@gmail.com>

pkgname=dam-git
pkgver=1771439
pkgrel=1
pkgdesc="DAM git"
arch=('any')
url="https://github.com/dudoslav/dam"
licence=('GPL3')
depends=('git' 'pacman' 'ruby' 'ruby-bundler')
source=("git+https://github.com/dudoslav/dam.git" "dam.service")
sha256sums=('SKIP'
            'af92c2dc71d1c960b4019227675e9f4b6f2bec409bea6b9189e1192e16c2acab')

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
    install -m 644 -D dam.service "$pkgdir/usr/lib/systemd/system"
}
