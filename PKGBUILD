# Maintainer: James Rose <james.rose1103@protonmail.com>
pkgname=rosary-git
pkgver=1.2.3
pkgrel=1
pkgdesc="A Bible App developed with tauri"
arch=('any')
url="https://github.com/RoseBlume/Rosary"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
makedepends=('git' 'file' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'base-devel' 'curl' 'wget' 'rustup' 'npm' 'nodejs' 'dpkg')
provides=('rosary')
conflicts=('rosary' 'rosary-tauri')
options=('!strip' '!emptydirs')
source=('git+https://github.com/RoseBlume/Rosary')
sha256sums=('SKIP')
prepare() {
	cd Rosary
	npm install
	npm run tauri build
}
package(){
	cd "$srcdir"/Rosary/src-tauri/target/release/bundle/deb
	dpkg-deb -x *.deb here
	cd here

	install -Dm755 usr/bin/rosary "$pkgdir"/usr/bin/rosary

    # Install desktop file
    install -Dm644 usr/share/applications/rosary.desktop "$pkgdir"/usr/share/applications/rosary.desktop

    # Install icons
    install -Dm644 usr/share/icons/hicolor/128x128/apps/rosary.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/rosary.png
    install -Dm644 usr/share/icons/hicolor/256x256@2/apps/rosary.png "$pkgdir"/usr/share/icons/hicolor/256x256@2/apps/rosary.png
    install -Dm644 usr/share/icons/hicolor/32x32/apps/rosary.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/rosary.png
	# Extract package data
}
