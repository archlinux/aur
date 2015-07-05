# Maintainer: Joakim Hernberg <jhernberg@alchemy.lu>

pkgname=python2-inet_diag
pkgver=0.2
pkgrel=2

pkgdesc="Python module to interface with inet_diag"
url="git://git.kernel.org/pub/scm/libs/python/python-inet_diag/python-inet_diag.git"
arch=('x86_64' 'i686')
license=('GPL')

depends=('python2')
makedepends=('git')

source=("$pkgname::git://git.kernel.org/pub/scm/libs/python/python-inet_diag/python-inet_diag.git"
        '0001-copy-paste-fixes.patch')
sha256sums=('SKIP'
            'c07e7cf6497c164b8372e8a4ccd7a4990a0736078344af408c3ec92cc888ca70')

prepare() {
  cd $pkgname
  patch -p1 -i "${srcdir}/0001-copy-paste-fixes.patch"
  sed -i '1s/python/python2/' psk.py
  sed -i '1s/python/python2/' pss.py
}

build() {
    cd $pkgname
    python2 setup.py build
}

package() {
  cd $pkgname
  python2 setup.py install --skip-build --root="$pkgdir"
  install -D -p -m 775 psk.py "$pkgdir"/usr/bin/psk
  install -p -m 775 pss.py "$pkgdir"/usr/bin/pss
}
# vim:set ts=2 sw=2 et:
