# Maintainer: Dusan Baran <work.dusanbaran@gmail.com>

pkgname=dam-git
pkgver=71b5dfb
pkgrel=1
pkgdesc="Simple download manager with web user interface "
arch=('any')
url="https://github.com/dudoslav/dam"
licence=('GPL3')
depends=('ruby' 'ruby-bundler')
makedepends=('git')
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
    install -m 644 -D "dam/config/config.yml" "$pkgdir/etc/dam.yml"
    install -d "$pkgdir/var/lib/dam/downloads"
}
