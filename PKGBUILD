# Maintainer: Stuart Mumford <stuart@cadair.com>
pkgname=python2-yt
_module_name=yt
pkgver=3.4.1
pkgrel=1
pkgdesc="A community-developed analysis and visualization toolkit for volumetric data"
arch=(any)
url="http://yt-project.org"
license=('BSD')
depends=('python2-numpy' 'python2-matplotlib' 'cython2' 'python2-nose' 'python2-sympy' 'python2-h5py')
optdepends=('ipython2' 'ipython2-notebook')
options=(!emptydirs)
source=("https://pypi.io/packages/source/y/${_module_name}/${_module_name}-${pkgver}.tar.gz"
        "yt33.patch")
sha256sums=('a4cfc47fe21683e7a3b680c05fe2a25fb774ffda6e3939a35755e5bf64065895' 'SKIP')

prepare() {
    cd "$srcdir/${_module_name}-$pkgver"
    patch -Np1 -i ../yt33.patch
}

package() {
  cd "$srcdir/${_module_name}-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 COPYING.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  cd $pkgdir/usr/bin
  mv iyt iyt2
}

# vim:set ts=2 sw=2 et:
