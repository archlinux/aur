# Maintainer:   Gabriel B. Casella <gbc921@gmail.com>
# Contributor:  Jonathan Wilson <bugs@pandorica.net>

pkgname=python2-crack
pkgver=0.5.1
pkgrel=2
pkgdesc="Python bindings for cracklib."
arch=('i686' 'x86_64')
license=('MIT/X')
depends=('python2' 'glibc' 'cracklib')
url="http://www.nongnu.org/python-crack/"
source=(http://download.savannah.gnu.org/releases/python-crack/python-crack-$pkgver.tar.gz
        python2_only.patch)

sha256sums=('3164ef072a405b5bb8d023760bf79d465b42574481888b466a66a5aeb7bc03e8'
            'a5048ae26d8f6cae5e1ac7e67d530d57cfac83bd44627270a20080344192b52f')

prepare()
{
  cd "$srcdir"/python-crack-"$pkgver"
  patch -Np0 -i "$srcdir/python2_only.patch"
  DEFAULT_DICTPATH=/usr/share/cracklib/pw_dict ./configure --prefix=/usr
  find -type f -name '*.py*' -exec sed -i 's|/usr/bin/python$|&2|g' {} \;
}

build()
{
  cd "$srcdir"/python-crack-"$pkgver"
  make
}

package() {
  cd "$srcdir"/python-crack-"$pkgver"

  install -Dm644 README "$pkgdir"/usr/share/licenses/"$pkgname"/README
  install -Dm644 INSTALL "$pkgdir"/usr/share/licenses/"$pkgname"/INSTALL

  make DESTDIR="$pkgdir"/ install
}

# vim:set ts=2 sw=2 et:
