# Contributor: Thomas Jost <schnouki@schnouki.net>
# Maintainer: SanskritFritz (gmail)

pkgname=duply
_mainver=2.5
pkgver=$_mainver.0
pkgrel=1
pkgdesc="A shell front end for duplicity. It manages backup job settings in profiles and allows to batch execute commands."
arch=('any')
url="http://duply.net/"
license=('GPL2')
depends=('duplicity')
makedepends=('txt2man')
source=( "https://sourceforge.net/projects/ftplicity/files/duply%20%28simple%20duplicity%29/$_mainver.x/duply_$pkgver.tgz")
md5sums=('b63c539de38cb9e4c351afe44225e88b')

package() {
  install -Dm755 "${srcdir}/${pkgname}_${pkgver}/duply" "$pkgdir/usr/bin/duply"
  install -dm755 "$pkgdir/usr/share/man/man1"
  "$pkgdir/usr/bin/duply" txt2man > "$pkgdir/usr/share/man/man1/duply.1"

  install -dm755 "$pkgdir/usr/lib/systemd/"{user,system}
  cp "${srcdir}/${pkgname}_${pkgver}/systemd-unit.examples/user/"* "$pkgdir/usr/lib/systemd/user/"
  cp "${srcdir}/${pkgname}_${pkgver}/systemd-unit.examples/system/"* "$pkgdir/usr/lib/systemd/system/"
  install -D "${srcdir}/${pkgname}_${pkgver}/systemd-unit.examples/HOWTO.txt" "$pkgdir/usr/share/doc/duply/HOWTO.txt"
  install -D "${srcdir}/${pkgname}_${pkgver}/"{INSTALL.txt,gpl-2.0.txt,CHANGELOG.txt} "$pkgdir/usr/share/doc/duply/"
}
