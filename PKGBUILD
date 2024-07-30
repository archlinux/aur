# Maintainer: Heorhi Valakhanovich <valahanovich@tut.by>

pkgname=('dlangide')
pkgver=0.8.19
pkgrel=2
pkgdesc="D language IDE based on DlangUI "
arch=('i686' 'x86_64')
url="https://github.com/buggins/dlangide"
license=("BSL-1.0")
groups=('dlang')
depends=('dtools' 'sdl2' 'glibc' 'gcc-libs' 'zlib' 'd-runtime' 'd-stdlib')
makedepends=('d-compiler' 'dub')

source=(
  "https://github.com/buggins/dlangide/archive/v$pkgver.tar.gz"
  dlangide.desktop
  dlangide.install
)
sha256sums=('0988dc3b8351d98d7b184648577d790da41630e9f528037cc3d59321976d4a7d'
            'dc3b72ef22bec75722266497f398b87a057b44b9add7dbf1ca1140521d553efa'
            '9fe12f1bc573f5d431fcc8f9ca3ed17fc1e1d30248ae3b58209fc53084ae0a4')

prepare() {
cd $srcdir/dlangide-$pkgver
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

