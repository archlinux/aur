# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Plague-doctor <plague at privacyrequired dot com>

pkgname=standardnotes-bin
_realname="Standard Notes"
pkgver=3.191.4
pkgrel=1
pkgdesc='Free, open-source encrypted notes app.'
arch=('x86_64' 'aarch64')
url='https://github.com/standardnotes/app'
license=('AGPL3')
depends=('hicolor-icon-theme')
options=(!strip)
provides=('standardnotes-desktop')
conflicts=('standardnotes-desktop')
install=standardnotes.install
source=("standard-notes.sh")
source_x86_64=("$pkgname-$pkgver-amd64.deb::$url/releases/download/%40standardnotes%2Fdesktop%40$pkgver/standard-notes-$pkgver-linux-amd64.deb")
source_aarch64=("$pkgname-$pkgver-aarch64.deb::$url/releases/download/%40standardnotes%2Fdesktop%40$pkgver/standard-notes-$pkgver-linux-arm64.deb")

sha256sums=('71f0811526d428b541ef39ee804b257ed60b1b9b5d620436c79ed77e17eb4d16')
sha256sums_x86_64=('860368816cdfbe2412e2621adfbf273417d23168dda901b46db91627a7ab5ec0')
sha256sums_aarch64=('53ebc0c14290ab50d5ea767d0e2cadaa9bd8e54a66f30daa88f4c3c88663c295')

prepare() {
	ar x "$pkgname-$pkgver-amd64.deb"
	tar xf data.tar.xz
}

package() {
	install -dv "$pkgdir/opt/$pkgname"
	cp -r $srcdir/opt/Standard\ Notes/* "$pkgdir/opt/$pkgname/"
	cp -r $srcdir/usr "$pkgdir/opt/$pkgname"

	install -D "$srcdir/usr/share/applications/standard-notes.desktop" "$pkgdir/opt/$pkgname"
	install -D "standard-notes.sh" "$pkgdir/usr/bin/standard-notes"
	install -d "$pkgdir/usr/share/icons/hicolor/512x512/apps/"
	install -d "$pkgdir/usr/share/applications/"

	sed -i -E '/Exec/c\Exec=env DESKTOPINTEGRATION=false /usr/bin/standard-notes' "$pkgdir/opt/$pkgname/standard-notes.desktop"
	ln -s "/opt/$pkgname/standard-notes.desktop" "$pkgdir/usr/share/applications/"
	ln -s "/opt/$pkgname/usr/share/icons/hicolor/512x512/apps/standard-notes.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/"
}