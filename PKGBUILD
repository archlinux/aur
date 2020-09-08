# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=pida-hg
pkgver=2921.be90809a5d81
pkgrel=1
pkgdesc="Snapshot of the last repository of the Python Integrated Development Application"
arch=('any')
url="http://pidsoff.appspot.com/pida"
license=('custom')
depends=('vte' 'python2-simplejson' 'python2-pygtkhelpers' 'dbus-python' 'python2-logbook' 'python2-notify' 'python2-py')
makedepends=('python2-distribute')
optdepends=('python2-anyvc: version control integration'
            'python2-apipkg: version control integration')
provides=('pida')
conflicts=('pida')
source=(https://files.pythonhosted.org/packages/47/70/abb5fae71af6f86c4341b0f5c1ab2163cb48b47259a6f86ddcecae27e2d0/pida-0.6.2.tar.gz pida.desktop nodrm.patch internal_moo.patch api_update.patch hg_update.tar.gz)
install=pida.install

package() {
  cd "$srcdir"/pida-0.6.2

  mv hgdistver.py pida/utils/
  patch -Np1 -i ../internal_moo.patch
  patch -Np1 -i ../api_update.patch
  patch -Np1 -i ../hg_update.patch
  #patch -Np1 -i ../nodrm.patch

  python2 setup.py install --root="$pkgdir" --prefix=/usr

  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/pida/LICENSE
  install -Dm644 pida/resources/pixmaps/pida-icon.png "$pkgdir"/usr/share/pixmaps/pida.png
  install -Dm644 "$srcdir"/pida.desktop "$pkgdir"/usr/share/applications/pida.desktop
}

md5sums=('6ee61497996abd54f8a9dacd39b90c8c'
         '0216466cf5f64238c90b5e07df71ce3a'
         '479c24a04069112f610667f9746011d4'
         '8dd22f63476c8f5ae7736e2e67bb50d1'
         '8f06de0f539769e5c35ec943e251bcf9'
         'b26e69a3514eea24d655cdeb732894e1')
