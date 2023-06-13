# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>

pkgname=black-pearl-origin
pkgver=0.3.0
pkgrel=1
pkgdesc='Free and open-source tool for managing game sources using community-made modules.'
arch=('x86_64')
url='https://github.com/BlackPearlOrigin/blackpearlorigin'
license=('BSD')
depends=('libayatana-appindicator' 'webkit2gtk-4.1' 'gtk3' 'openssl-1.1')
makedepends=('yarn')
source=("$url/archive/refs/tags/pbp-stable-v$pkgver.tar.gz")

sha256sums=('cfe82e3a5f3768ad202dd393371c3559b6ba92d08aaf17a5226de0d3f024aeb6')

build () {
   cd "$srcdir/blackpearlorigin-pbp-stable-v$pkgver"
   yarn install
   yarn tauri build --bundles deb
	}

package () {
   cd "$srcdir/blackpearlorigin-pbp-stable-v$pkgver/src-tauri/target/release/bundle/deb/project-black-pearl_0.3.0_amd64/data/"
   install -Dv "./usr/bin/project-black-pearl" "$pkgdir/usr/bin/$pkgname"
   install -Dv "./usr/share/applications/project-black-pearl.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
   install -Dv "./usr/share/icons/hicolor/32x32/apps/project-black-pearl.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
   install -Dv "./usr/share/icons/hicolor/128x128/apps/project-black-pearl.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
   install -Dv "./usr/share/icons/hicolor/256x256@2/apps/project-black-pearl.png" "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/$pkgname.png"
	}

