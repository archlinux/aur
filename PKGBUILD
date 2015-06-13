# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Mario Blättermann <mariobl@gnome.org>
# Contributor: bidulock (AUR)
# Maintainer: SanskritFritz (gmail)

pkgname=pclock
pkgver=0.13.1
pkgrel=8
pkgdesc="Dockapp showing a simple analog clock."
#url="http://dockapps.windowmaker.org/file.php/id/7"
url="http://web.archive.org/web/20121130081327/http://dockapps.windowmaker.org/file.php/id/7"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxpm')
#source=("http://dockapps.windowmaker.org/download.php/id/12/$pkgname-$pkgver.tgz")
source=("$pkgname-$pkgver.tgz")

md5sums=('c700933e3ec53beed738c5167fc255c1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 src/$pkgname "$pkgdir/usr/bin/$pkgname"
  for xpmfile in XPM/* ; do
    install -Dm644 "$xpmfile" "$pkgdir/usr/share/$pkgname/$xpmfile"
  done
  for demofile in demos/* ; do
    sed -i "s/..\/src\///" "$demofile"
    install -Dm755 "$demofile" "$pkgdir/usr/share/$pkgname/$demofile"
  done
  for file in README CREDITS CHANGES TODO COPYING ; do
    install -Dm644 $file "$pkgdir/usr/share/doc/$pkgname/$file"
  done
}
