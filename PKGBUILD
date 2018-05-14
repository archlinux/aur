# Maintainer: Anton Strömkvist <anton@stromkvist.com>
pkgname=log
pkgver=1.0.5
pkgrel=1
epoch=
pkgdesc="Log & time-tracker"
arch=('x86_64')
url="https://github.com/joshavanier/log"
license=('MIT')
groups=()
depends=()
makedepends=('npm' 'sed')
checkdepends=()
optdepends=()
provides=("log")
conflicts=("log")
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/joshavanier/$pkgname/archive/$pkgver.tar.gz")
noextract=()
md5sums=("f02e9c8dca9cfde93365dad1edd64669")
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	npm install
}

build() {
	cd "$pkgname-$pkgver"
  npm run-script build_linux
}

package() {
	cd "$pkgname-$pkgver"
	install -d "$pkgdir/usr/bin/"
	install -d "$pkgdir/usr/lib/"
	install -d "$pkgdir/usr/share/applications/"
  install -d "$pkgdir/usr/share/icons/hicolor/512x512/apps/"
  cp -r "$srcdir/$pkgname-$pkgver/build/Log-linux-x64" "$pkgdir/usr/lib/Log"
  cp "$srcdir/$pkgname-$pkgver/log.desktop" "$pkgdir/usr/share/applications/log.desktop"
  sed -i 's;icon.png;log;' "$pkgdir/usr/share/applications/log.desktop"
  cp "$srcdir/$pkgname-$pkgver/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/log.png"
	ln -s "/usr/lib/Log/Log" "$pkgdir/usr/bin/log"
}
