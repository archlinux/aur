# Maintainer: username227 <gfrank227 [at] gmail [dot] com>

_pkgname=nhex
pkgname=${_pkgname}
pkgver=0.5.2
pkgrel=1
pkgdesc="A next-generation IRC client inspired by HexChat"
arch=(x86_64)
url="https://github.com/nhexirc/nhex"
license=('MIT' 'MPL-2.0')
depends=('gcc-libs' 'libsoup' 'webkit2gtk')
makedepends=('npm' 'git' 'rust' 'nodejs')
provides=("$_pkgname")
conflicts=('nhex-bin' 'nhex-git')
source=("https://github.com/nhexirc/nhex/archive/refs/tags/v$pkgver.tar.gz"
	"nhex.desktop")
sha256sums=('483d9a1f5320f3d329658c2a412bfdd32560ce14783dafd71a19c7d5d681915c'
            '23d57b49f521c3a238ce86baf08a3f862de1b1c19e08cc68ec6c96112c42d766')
options=('!lto')


build() {
cd $srcdir/nhex-$pkgver/packages/client/src-tauri
npm install
npm run tauri build
}

package() {
install -Dm755 $srcdir/nhex-$pkgver/packages/client/src-tauri/target/release/nhex -t $pkgdir/usr/bin
install -Dm755 $srcdir/nhex-$pkgver/packages/client/public/nhex.png -t $pkgdir/usr/share/pixmaps
install -Dm755 $srcdir/nhex.desktop -t $pkgdir/usr/share/applications
}
