# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=pida-hg
pkgver=2921.be90809a5d81
pkgrel=1
pkgdesc="Python Integrated Development Application"
arch=('any')
url="http://pidsoff.appspot.com/pida"
license=('custom')
depends=('vte' 'python2-simplejson' 'python2-pygtkhelpers' 'dbus-python' 'python2-logbook' 'python2-notify' 'python2-py')
makedepends=('mercurial' 'python2-distribute')
optdepends=('python2-anyvc: version control integration'
            'python2-apipkg: version control integration')
provides=('pida')
conflicts=('pida')
source=(hg+https://bitbucket.org/aafshar/pida-main pida.desktop nodrm.patch)
install=pida.install

pkgver() {
  cd "$srcdir"/pida-main
  echo `hg identify -n`.`hg identify -i`
}

package() {
  cd "$srcdir"/pida-main
  
  patch -Np1 -i $srcdir/nodrm.patch
  #patch -Np1 -i $srcdir/internal_moo.patch
  #patch -Np1 -i $srcdir/api_update.patch
  python2 setup.py install --root="$pkgdir" --prefix=/usr

  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/pida/LICENSE
  
  install -Dm644 pida/resources/pixmaps/pida-icon.png "$pkgdir"/usr/share/pixmaps/pida.png
  install -Dm644 $startdir/src/pida.desktop "$pkgdir"/usr/share/applications/pida.desktop
}
md5sums=('SKIP' '0216466cf5f64238c90b5e07df71ce3a' '479c24a04069112f610667f9746011d4')
