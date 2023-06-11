# Maintainer: Heorhi Valakhanovich <valahanovich@tut.by>

pkgname=('dlangide')
pkgver=0.8.18
pkgrel=1
pkgdesc="D language IDE based on DlangUI "
arch=('i686' 'x86_64')
url="https://github.com/buggins/dlangide"
license=("BSL")
groups=('dlang')
depends=('dtools' 'sdl2' 'glibc' 'gcc-libs' 'zlib' 'd-runtime' 'd-stdlib')
makedepends=('d-compiler' 'dub')

source=(
  "https://github.com/buggins/dlangide/archive/v$pkgver.tar.gz"
  dlangide.desktop
  dlangide.install
  dlangui.patch
)
sha256sums=('d04803aed51bf2481adefdbf67523009bb1b54fd57c7e28c46062040fb6cea30'
            'dc3b72ef22bec75722266497f398b87a057b44b9add7dbf1ca1140521d553efa'
            '9fe12f1bc573f5d431fcc8f9ca3ed17fc1e1d30248ae3b58209fc53084ae0a4e'
            'f17cb696d2632f6c52da11fc96b8236b07a1fa0577f94e88fb6ac7c327984d23')

prepare() {
cd $srcdir/dlangide-$pkgver
patch -p1 -i "../dlangui.patch"
}

build() {
	cd $srcdir/dlangide-$pkgver
	dub build --build=release
}
package() {
	# binary
	install -Dm755 "$srcdir/dlangide-$pkgver/bin/dlangide" "$pkgdir/usr/bin/dlangide"
	# license
	install -Dm644 "$srcdir/dlangide-$pkgver/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	# icon
	install -Dm644 "$srcdir/dlangide.desktop" "$pkgdir/usr/share/applications/dlangide.desktop"
	install -Dm644 "$srcdir/dlangide-$pkgver/views/res/mdpi/dlangui-logo1.png" "$pkgdir/usr/share/pixmaps/dlangui-logo1.png"
}

