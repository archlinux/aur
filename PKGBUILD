# Maintainer: Takumi <dGFrdW9oQHR1dGEuaW8K | base64 -d>
pkgname=ttf-seto
pkgver=1
_pkgver=6.20
pkgrel=9
_pkgrel=8
epoch=7
makedepends=('glibc')
pkgdesc="handwriting Japanese font including JIS X 0213 kanji (Extracted from ubuntu package)"
arch=(any)
url="https://setofont.osdn.jp/"
license=('OFL:1.1')
source=("http://ports.ubuntu.com/pool/universe/f/fonts-seto/fonts-seto_${_pkgver}-${_pkgrel}_all.deb")

sha256sums=('41316849ede6874adf1b60207f9d3fc25111953729c5c45ac84e9e4f76d5f53f')

prepare() {
        tar xvf data.tar.xz
}

build() {
        iconv -f sjis -t utf-8 $srcdir/usr/share/doc/fonts-seto/readme.txt -o $srcdir/usr/share/doc/fonts-seto/readme.txt
}

package() {
        install -Dm644 $srcdir/usr/share/doc/fonts-seto/readme.txt $pkgdir/usr/share/doc/$pkgname/readme.txt
        install -Dm644 $srcdir/usr/share/doc/fonts-seto/copyright $pkgdir/usr/share/licenses/$pkgname/copyright
        install -d $pkgdir/usr/share/fonts/TTF
        install -m644 ${srcdir}/usr/share/fonts/truetype/seto/*.ttf ${pkgdir}/usr/share/fonts/TTF/
}
