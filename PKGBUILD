# Maintainer: hendrikcech <hendrik.cech@gmail.com>
# Contributor: Spider.007 <archPackage@spider007.net>
# Contributor: Marek Küthe <m.k@mk16.de>

pkgname=scamper
pkgver=20230614d
pkgrel=1
pkgdesc="a tool that actively probes the Internet in order to analyze topology and performance"
url="https://www.caida.org/catalog/software/scamper/"
source=("https://www.caida.org/catalog/software/scamper/code/$pkgname-cvs-$pkgver.tar.gz")
sha512sums=('98fdfd4a7119b1e588358e8e985a8201ed8b75e3e5bda5b46fd9f3d9da2881a234053026ad8c108ad183f41aaadfa24e9fdf7e2c1f66c5d2221f48127d0107c9')
depends=('openssl' 'zlib' 'bzip2' 'xz')
license=('GPL-2.0-or-later')
arch=('i686' 'x86_64')

build() {
    cd "$pkgname-cvs-$pkgver"

    ./configure --prefix=/usr
    make -j "$(nproc)"
}

package() {
    cd "$pkgname-cvs-$pkgver"

    make DESTDIR="$pkgdir/" install
    chmod u+s $pkgdir/usr/bin/scamper
}
