# Maintainer: nulldayo <nulldayo at inatuz dot im>
pkgname=pcf-shinonome
pkgver=0.9.11
pkgrel=1
pkgdesc="Shinonome Japanese bitmap font family (12, 14 and 16 dot fonts)"
arch=('any')
url="http://openlab.ring.gr.jp/efont/shinonome"
license=('custom:PublicDomain')

depends=()
makedepends=('perl' 'gawk' 'xorg-bdftopcf' 'xorg-mkfontscale')

source=("shinonome.tar.bz2::http://openlab.ring.gr.jp/efont/dist/shinonome/shinonome-0.9.11-src.tar.bz2")
noextract=("shinonome.tar.bz2")
sha256sums=('bc0b023096dcab99cccd61fe774e247b4e076a3c264c95f53e128dc23c79c729')

build() {
    cd "$srcdir"
    tar -xjf "shinonome.tar.bz2"
    cd "${srcdir}/shinonome-0.9.11-src"
    ./configure \
        --with-fontdir=/usr/share/fonts/shinonome \
        --with-pcf \
        --without-bdf \
        --enable-compress=gzip
    make
}

package() {
    cd "$srcdir/shinonome-0.9.11-src"
    make FONTDIR="$pkgdir/usr/share/fonts/shinonome" install

    # license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
