# Maintainer: Hyacinthe Cartiaux <hyacinthe dot cartiaux at free dot fr>
# Contributor: hcra <hcra at u53r dot space>
# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname=netcalc
pkgver=2.1.7
pkgrel=1
pkgdesc='IP network calculator - Simplified clone of sipcalc with ipcalc looks'
arch=('aarch64' 'x86_64')
url='https://github.com/troglobit/netcalc'
license=('BSD-3-Clause')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('57e40571cea9061f4c42fe500345d6715e9b35fdaa135ef23c42c6ca4a58e3ef')
conflicts=(ipcalc)
depends=(glibc)

build() {
    cd "$srcdir/$pkgname-$pkgver"

    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    make DESTDIR="$pkgdir" install-strip

    install -vdm0755 "$pkgdir/usr/share/licenses/$pkgname"
    mv -vf "$pkgdir/usr/share/doc/$pkgname/LICENSE" \
      "$pkgdir/usr/share/licenses/$pkgname/"
}
