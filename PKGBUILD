# Maintainer: Stuart Mumford <stuart@cadair.com>
pkgname=python2-yt
_module_name=yt
pkgver=3.2.3
pkgrel=1
pkgdesc="A community-developed analysis and visualization toolkit for volumetric data"
arch=(any)
url="http://yt-project.org"
license=('BSD')
depends=('python2-numpy' 'python2-matplotlib' 'cython2' 'python2-nose' 'python2-sympy' 'python2-h5py')
optdepends=('ipython2' 'ipython2-notebook')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/y/${_module_name}/${_module_name}-${pkgver}.tar.gz"
        "yt32.patch")
md5sums=('b81757057ae08360afc6ca2e74e1a3a8'
         'SKIP')

prepare() {
    cd "$srcdir/${_module_name}-$pkgver"
    patch -Np1 -i ../yt32.patch
}

package() {
  cd "$srcdir/${_module_name}-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 COPYING.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  cd $pkgdir/usr/bin
  mv iyt iyt2
  mv pyro_queue.py pyro_queue2.py
  mv yt_lodgeit.py yt_lodgeit2.py
}

# vim:set ts=2 sw=2 et:
