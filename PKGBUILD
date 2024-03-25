# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Plague-doctor <plague at privacyrequired dot com>

pkgname=standardnotes-bin
_realname="Standard Notes"
pkgver=3.192.4
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
sha256sums_x86_64=('850a8a2df2820110ef4d423fa843859613ee0c3c68a6410c747277b3149d69b6')
sha256sums_aarch64=('df5be199f94b85d332463cc96370b9722e415cc42307cef6417a449a224c0706')

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