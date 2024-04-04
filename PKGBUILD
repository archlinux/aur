# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>

pkgname=black-pearl-origin
pkgver=1.2.1
pkgrel=1
pkgdesc='Free and open-source tool for managing game sources using community-made modules.'
arch=('x86_64')
url='https://github.com/BlackPearlOrigin/blackpearlorigin'
license=('BSD')
depends=('libayatana-appindicator' 'webkit2gtk-4.1' 'gtk3' 'openssl-1.1')
makedepends=('yarn' 'rust' 'webkit2gtk')
source=("$url/archive/refs/tags/$pkgver.tar.gz")

sha256sums=('14a2b17757142387815a3da9c6e8be05f2d535d877d8e281419da5a97d98ecff')

build () {
   cd "$srcdir/blackpearlorigin-$pkgver"
   yarn install
   yarn tauri build --bundles deb
	}

package () {
   cd "$srcdir/blackpearlorigin-$pkgver/src-tauri/target/release/bundle/deb/black-pearl-origin_${pkgver}_amd64/data/"
   install -Dv "./usr/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
   install -Dv "./usr/share/applications/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
   install -Dv "./usr/share/icons/hicolor/32x32/apps/$pkgname.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
   install -Dv "./usr/share/icons/hicolor/128x128/apps/$pkgname.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
   install -Dv "./usr/share/icons/hicolor/256x256@2/apps/$pkgname.png" "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/$pkgname.png"
	}
