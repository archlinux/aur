# Maintainer: Artem Suprun <efogdev@gmail.com>

pkgname=play-timer
pkgver=2.1.1
pkgrel=2
pkgdesc="CLI-friendly easy-to-use timer app with native DE integration."
arch=('x86_64')
curarch=$(uname -m)
url="https://github.com/efogdev/mpris-timer"
license=('MIT')
depends=('glib2' 'gtk3' 'wayland' 'pulse-native-provider')
source=("$pkgname-$curarch::$url/releases/download/$pkgver/$pkgname-$curarch"
        "$pkgname-$curarch.sha256::$url/releases/download/$pkgver/$pkgname-$curarch.sha256")
sha256sums=('SKIP' 'SKIP')
glibname="io.github.efogdev.mpris-timer"
 
prepare() {
  sha256sum -c "$srcdir/$pkgname-$curarch.sha256"
  git clone "$url" "$srcdir/repo"
  cp -r "$srcdir/repo/misc" "$srcdir/"
  cp -r "$srcdir/repo/internal/ui/res" "$srcdir/"
}

package() {
  install -Dm755 "$srcdir/$pkgname-$curarch" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/misc/$glibname.desktop" \
    "$pkgdir/usr/share/applications/$glibname.desktop"
  install -Dm644 "$srcdir/misc/$glibname.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/$glibname.metainfo.xml"
  install -Dm644 "$srcdir/misc/$glibname.gschema.xml" \
    "$pkgdir/usr/share/glib-2.0/schemas/$glibname.gschema.xml"
  install -Dm644 "$srcdir/res/icon.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$glibname.svg"
}
