# Maintainer: Dusan Baran <work.dusanbaran@gmail.com>

pkgname=dam-git
pkgver=1771439
pkgrel=2
pkgdesc="DAM git"
arch=('any')
url="https://github.com/dudoslav/dam"
licence=('GPL3')
depends=('git' 'pacman' 'ruby' 'ruby-bundler')
source=("git+https://github.com/dudoslav/dam.git" "dam.service")
sha256sums=('SKIP'
            '437d3d405744bbeaf620c850ba69c36a2fa29fa5fa0fe92b7767be283dfd7726')

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
