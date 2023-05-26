# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>

pkgname=project-black-pearl
pkgver=0.3.0
pkgrel=1
pkgdesc='Free and open-source tool for managing game sources using community-made modules.'
arch=('x86_64')
url='https://github.com/ProjectBlackPearl/project_black_pearl'
license=('BSD')
depends=('libayatana-appindicator' 'webkit2gtk-4.1' 'gtk3')
makedepends=('yarn' 'cargo-tauri' 'rust')
provides=('project-black-pearl')
conflicts=('project-black-pearl')
source=("$url/archive/refs/tags/pbp-stable-v$pkgver.tar.gz")

sha256sums=('27cda670348bc6b2388a29e925dcb6ac96ff9dd0fe06690288f369f0b01b3f78')

build () {
   cd "$srcdir/project_black_pearl-pbp-stable-v$pkgver"
   yarn install
   yarn tauri build --bundles deb
	}

package () {
   cd "$srcdir/project_black_pearl-pbp-stable-v$pkgver/src-tauri/target/release/bundle/deb/project-black-pearl_0.3.0_amd64/data/"
   install -Dv "./usr/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
   install -Dv "./usr/share/applications/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
   install -Dv "./usr/share/icons/hicolor/32x32/apps/$pkgname.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
   install -Dv "./usr/share/icons/hicolor/128x128/apps/$pkgname.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
   install -Dv "./usr/share/icons/hicolor/256x256@2/apps/$pkgname.png" "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/$pkgname.png"
	}

