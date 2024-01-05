# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Plague-doctor <plague at privacyrequired dot com>

pkgname=standardnotes-bin
_realname="Standard Notes"
pkgver=3.183.39
pkgrel=2
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
sha256sums_x86_64=('49a05a6aba9a570bd782735c4619b60e87f078b5f77e0b36693a5bd085269460')
sha256sums_aarch64=('fcf9a90b41dc1eb8deea6721572e32407a3e9439ae60d0c3416fa611fca0b59e')

prepare() {
	ar x "$pkgname-$pkgver-amd64.deb"
	tar xf data.tar.xz
}

package() {
	install -dv "$pkgdir/opt/$pkgname"
    cp -rv $srcdir/opt/Standard\ Notes/* "$pkgdir/opt/$pkgname/"
	cp -rv $srcdir/usr/* "$pkgdir/opt/$pkgname"

	install -Dv "$srcdir/usr/share/applications/standard-notes.desktop" "$pkgdir/opt/$pkgname"
	install -Dv "standard-notes.sh" "$pkgdir/usr/bin/standard-notes"
	install -dv "$pkgdir/usr/share/icons/hicolor/512x512/apps/"
	install -dv "$pkgdir/usr/share/applications/"

	sed -i -E '/Exec/c\Exec=env DESKTOPINTEGRATION=false /usr/bin/standard-notes' "$pkgdir/opt/$pkgname/standard-notes.desktop"
	ln -sv "/opt/$pkgname/standard-notes.desktop" "$pkgdir/usr/share/applications/"
	ln -sv "/opt/$pkgname/standard-notes.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/"
}
