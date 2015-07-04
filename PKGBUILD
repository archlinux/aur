# Maintainer: Joakim Hernberg <jhernberg@alchemy.lu>

pkgname=python2-inet_diag
pkgver=0.2
pkgrel=1

pkgdesc="Python module to interface with inet_diag"
url="git://git.kernel.org/pub/scm/libs/python/python-inet_diag/python-inet_diag.git"
arch=('x86_64' 'i686')
license=('GPL')

depends=('python2')
makedepends=('git')

source=("$pkgname::git://git.kernel.org/pub/scm/libs/python/python-inet_diag/python-inet_diag.git"
        'remove-duplicate-variable-declaration.patch')
sha256sums=('SKIP'
            'ef229b85eeb8cc47dece0d9039ea6aad4032e3eaf4cda1ef5b5a531f9dd37b36')

prepare() {
  cd $pkgname
  patch -p1 -i "${srcdir}/remove-duplicate-variable-declaration.patch"
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
