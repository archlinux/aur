# Maintainer: Aleksandr <orthodox dot tk at gmail dot com>

pkgname=ponomar
pkgver=0.80.0d8052d
pkgrel=5
pkgdesc="Ponomar: a liturgics suite for the Orthodox Church http://www.ponomar.net/"
arch=('any')
url="http://www.ponomar.net/"
license=('GPL')
groups=()
depends=('java-runtime' 'texinfo')
optdepends=('fonts-churchslavonic')
install=$pkgname.install
source=("https://github.com/typiconman/ponomar/archive/master.zip"
        "$pkgname.desktop"
        "$pkgname.sh"
        "$pkgname.png"
        "profile.sh")
md5sums=('b2f8b00fdb4aa884f72c575fb6528967'
         '0319a1d4a39d812a54df420280d129f9'
         '8968b56483a1fb7c6fb2ca903807d567'
         'd8b4f7dd400cd7240ec63c8bcaddaec6'
         'ec1af1f47c6770f55d23c74880a9d437')

build() {
  cd "$srcdir/$pkgname-master"
  make
}

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/etc/profile.d" 
  install -dm755 "$pkgdir/opt" 
  install -dm755 "$pkgdir/usr/share/applications" 
  install -dm755 "$pkgdir/usr/share/pixmaps" 
  install -dm755 "$pkgdir/usr/bin"
  cp -r "$pkgname-master" "$pkgdir/opt/$pkgname"
  install -Dm755 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 $pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm755 $pkgname.sh "$pkgdir/opt/$pkgname/$pkgname.sh"
  install -Dm755 profile.sh "$pkgdir/etc/profile.d/$pkgname.sh"
  # Fix permissions
  chmod 666 "$pkgdir/opt/$pkgname/Ponomar/languages/xml/$pkgname.config"
}

# vim:set ts=2 sw=2 et:
