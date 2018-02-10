# Maintainer: Dusan Baran <work.dusanbaran@gmail.com>

pkgname=dam-git
pkgver=1771439
pkgrel=3
pkgdesc="DAM git"
arch=('any')
url="https://github.com/dudoslav/dam"
licence=('GPL3')
depends=('git' 'pacman' 'ruby' 'ruby-bundler')
source=("git+https://github.com/dudoslav/dam.git" "dam.service")
sha256sums=('SKIP'
            'f8c7d5732fce7f08b8f101dbe37b4b76a590f99504e253c0348a089c2d4196f6')

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
