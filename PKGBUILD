# Contributor: Thomas Jost <schnouki@schnouki.net>
# Maintainer: SanskritFritz (gmail)

pkgname=duply
_mainver=2.0
pkgver=$_mainver.3
pkgrel=2
pkgdesc="A shell front end for duplicity. It manages backup job settings in profiles and allows to batch execute commands."
arch=('any')
url="http://duply.net/"
license=('GPL2')
depends=('duplicity')
makedepends=('txt2man')
source=( "http://downloads.sourceforge.net/project/ftplicity/duply%20%28simple%20duplicity%29/${_mainver}.x/${pkgname}_${pkgver}.tgz")
md5sums=('3d68604a87103ee6ff1bfd029c0e1627')

prepare() {
  cd "${srcdir}/${pkgname}_${pkgver}"
  sed -i $'s|^DEFAULT_PYTHON=\'python\'$|DEFAULT_PYTHON=\'python2\'|' duply
  sed -i 's|^#PYTHON="python"$|#PYTHON="python2"|' duply
}

package() {
  install -Dm755 "${srcdir}/${pkgname}_${pkgver}/duply" "$pkgdir/usr/bin/duply"
  install -dm755 "$pkgdir/usr/share/man/man1"
  "$pkgdir/usr/bin/duply" txt2man > "$pkgdir/usr/share/man/man1/duply.1"

}

