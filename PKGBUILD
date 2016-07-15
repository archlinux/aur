# Maintainer: shad0w73 <shad0w73@maills.de>
pkgname=helden-software
pkgver=5.5.2
pkgrel=1
_realpkgrel=1
pkgdesc='Die Heldenverwaltung für das Pen&Paper-Rollenspiel "Das Schwarze Auge" (DSA)'
arch=('any')
url="http://www.helden-software.de"
license=('custom')
depends=('java-runtime' 'hicolor-icon-theme' 'bash')
source=("http://online.helden-software.de/rep/pool/main/h/${pkgname}/${pkgname}_${pkgver}-${_realpkgrel}_all.deb")
sha256sums=('15f129efc99f0ad97cc6d7956be625dc0e1aeb51a157323216f824dfda67c485')

prepare() {
  cd "$srcdir"
  tar -xzf data.tar.gz
}

package() {
  cd "$srcdir"

  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -dm755 "$pkgdir/usr/share/$pkgname"

  install -m644 usr/lib/heldensoftware/helden5.jar "$pkgdir/usr/share/$pkgname/helden5.jar"
  install -m644 usr/share/doc/$pkgname/changelog.gz "$pkgdir/usr/share/doc/$pkgname/changelog.gz"
  install -m644 usr/share/doc/$pkgname/copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cp -r etc "$pkgdir/"
  cp -r usr/share/icons "$pkgdir/usr/share/"

  sed s/games/bin/ usr/share/applications/HeldenSoftware.desktop > "$pkgdir/usr/share/applications/$pkgname.desktop"

  sed "s/lib\/heldensoftware/share\/helden-software/" usr/games/$pkgname > "$pkgdir/usr/bin/$pkgname"
  chmod 755 "$pkgdir/usr/bin/$pkgname"
}
