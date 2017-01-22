# $Id: PKGBUILD 111287 2014-05-16 00:49:12Z bgyorgy $
# Maintainer:  Federico Cinelli <cinelli@aur.archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=kiwi
pkgver=1.9.29
pkgrel=4
pkgdesc="A set of classes and wrappers for PyGTK"
arch=('any')
url="http://www.async.com.br/projects/kiwi"
license=("LGPL")
depends=('pygtk')
options=(!emptydirs)
source=("http://download.gnome.org/sources/$pkgname/1.9/$pkgname-$pkgver.tar.bz2")
sha256sums=('0ffa912cd180b3092b3ff636c582ab2c40f0f8eb541ada07b1432631a2d49e90')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Apply Python2 fix.
  for file in bin/{kiwi-i18n,kiwi-ui-test} setup.py kiwi/i18n/msgfmt.py; do
    echo "Applying python2 fix for $file"
    sed -i 's_/usr/bin/env python_/usr/bin/env python2_' "$file"
  done
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir"
}
