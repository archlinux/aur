# Maintainer: Coral Pink <coral.pink@disr.it>
pkgname=debounce
pkgver=0.3.0
pkgrel=1
pkgdesc='A utility for debouncing lines from stdin'
url='https://codeberg.org/coralpink/debounce'
arch=('x86_64' 'aarch64')
license=('GPL-3.0-or-later')
source=(
    "$pkgname.tar.gz::https://codeberg.org/coralpink/debounce/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
    "$pkgname.tar.gz.sig::https://codeberg.org/coralpink/debounce/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.sig"
)
b2sums=(
    '81201aab534ecb4d6f20d4e750e8d2386c2013ab0486d386d19a0e297e34a726d0e59ca9cade4b10f444dac5232dd3f76f215dfe311801a457366f1a757bf119'
    '01e5ee561acf9baa1980c1bcf0506f7129f13e3001c470cf13b5e42aab35ca349a9668fbdb1323edc4931163be04fc0b516c1de258792a6554608a89f40e56d3'
)
validpgpkeys=('88CF318EE94748D582940E86CC5693B9689DB487')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr --enable-nls --with-bash-completion
    make
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    make check
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}

