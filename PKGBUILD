# pkgver=$(curl -s "$url" | gzip -cd | sed -n '/^[0-9]/{s,/,,gp;q}')-"$pkgver"
pkgname=conflict
pkgver=20150705
pkgrel=1

pkgdesc='filename conflict listing'
url='http://invisible-island.net/conflict/conflict.html'
arch=('i686' 'x86_64')
license=('MIT')

depends=('glibc')

source=('http://invisible-island.net/datafiles/release/conflict.tar.gz')

sha256sums=('30e14808768a938df139a1b76f8f7397e1b3bf46a18ceabcc8b1b1a70d5ea8a9')

build() {
    cd conflict-"$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd conflict-"$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm0644 COPYING "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING
}
