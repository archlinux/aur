# pkgver=$(curl -s "$url" | gzip -cd | sed -n '/^[0-9]/{s,/,,gp;q}')
pkgname=conflict
pkgver=20150705
pkgrel=2

pkgdesc='filename conflict listing'
url='http://invisible-island.net/conflict/conflict.html'
arch=('i686' 'x86_64')
license=('MIT')

depends=('glibc')

validpgpkeys=('C52048C0C0748FEE227D47A2702353E0F7E48EDB') # Thomas Dickey

source=("https://invisible-mirror.net/archives/conflict/conflict-$pkgver.tgz"
        "https://invisible-mirror.net/archives/conflict/conflict-$pkgver.tgz.asc")

sha256sums=('30e14808768a938df139a1b76f8f7397e1b3bf46a18ceabcc8b1b1a70d5ea8a9'
            'SKIP')

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
