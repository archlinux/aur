# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=pida-hg
pkgver=2921.be90809a5d81
pkgrel=2
pkgdesc="Snapshot of the last repository of the Python Integrated Development Application"
arch=('any')
url="http://pidsoff.appspot.com/pida"
license=('custom')
depends=('vte-legacy' 'python2-simplejson' 'python2-pygtkhelpers' 'python2-dbus' 'python2-notify' 'python2-py')
makedepends=('python2-distribute')
optdepends=('python2-anyvc: version control integration'
            'python2-apipkg: version control integration')
provides=('pida')
conflicts=('pida')
source=(https://files.pythonhosted.org/packages/47/70/abb5fae71af6f86c4341b0f5c1ab2163cb48b47259a6f86ddcecae27e2d0/pida-0.6.2.tar.gz pida.desktop nodrm.patch partial_revert.patch json.patch internal_moo.patch api_update.patch hg_update.tar.gz)
install=pida.install

package() {
  cd "$srcdir"/pida-0.6.2

  mv hgdistver.py pida/utils/
  patch -Np1 -i ../internal_moo.patch
  patch -Np1 -i ../api_update.patch
  patch -Np1 -i ../hg_update.patch
  patch -Np1 -i ../json.patch
  patch -Np1 -i ../partial_revert.patch
  #patch -Np1 -i ../nodrm.patch

  python2 setup.py install --root="$pkgdir" --prefix=/usr

  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/pida/LICENSE
  install -Dm644 pida/resources/pixmaps/pida-icon.png "$pkgdir"/usr/share/pixmaps/pida.png
  install -Dm644 "$srcdir"/pida.desktop "$pkgdir"/usr/share/applications/pida.desktop
}

sha256sums=('f8476c9a36399b525a18761b709c204ae3f3c4344a4334b726d4ddccfca17a34'
            '145e340a66e3ebce242d4dfb4bc58c81d01ddfa07aac981ed4e70c8c97eb7dec'
            'c8be7fab72344e097375ac76e8de6d59c516c6a6084f771d55538bce4b69e83d'
            '8cbe9fac4ca3a3c124c4b294363e3767e03ac2a4d5f6bdecb27ad293b6341c3b'
            'f27c5de285f0795a8d680974afac39968e3a1fc3b64d1b38bfa0a2da07576a7e'
            '8899d86b094970be7da56cfc56c02ec256870a4ce68966eaa684f3b390addf7f'
            '5582539ace888fbef4c22fa3db80bd760a8f587bdc9efb767de3dda50b80febe'
            'fc4d95873660d581d489adaaeac3f8daa26c0698dbac65d3015a6c185b316b67')
