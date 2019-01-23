# Maintainer: Wei Congrui < crvv.mail at gmail dot com >

_gopkgname='github.com/prest/prest'

pkgname=prest
pkgver=0.3.4
pkgrel=1
pkgdesc='Serve a RESTful API from any PostgreSQL database'
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url='https://postgres.rest/'
license=('MIT')
backup=('etc/prest.toml')
makedepends=('go>=1.11.4')
source=("https://$_gopkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        'prest.service'
        'prest.toml')
sha256sums=('cc45eb5de17a1957124545e11ae6dcc6e3957e9d5e9b06acf37a341113963829'
            '75ddc96a1997452c4e244384be375761e34274857b1a3a6bc541e0c6500f2d8e'
            'b04f132360a2f6e1f66bc64e7b48a1474e4296a1e22344bc437b17b122e90af6')

build() {
    cd $pkgname-$pkgver
    go build
}

package() {
    install -D -m 0755 "$pkgname-$pkgver/prest" "$pkgdir/usr/bin/prest"
    install -D -m 0644 prest.service "$pkgdir/usr/lib/systemd/system/prest.service"
    install -D -m 0644 prest.toml "$pkgdir/etc/prest.toml"
}
