# Maintainer: Miguel de Val-Borro <miguel.deval@gmail.com>
# Maintainer: Stuart Mumford <stuart@cadair.com>
pkgname=python2-yt
_module_name=yt
pkgver=3.6.0
pkgrel=1
pkgdesc="A community-developed analysis and visualization toolkit for volumetric data"
arch=(any)
url="http://yt-project.org"
license=('BSD')
depends=('python2-numpy' 'python2-matplotlib' 'cython2' 'python2-nose' 'python2-sympy' 'python2-h5py')
optdepends=('ipython2' 'ipython2-notebook')
options=(!emptydirs)
source=("https://pypi.io/packages/source/y/${_module_name}/${_module_name}-${pkgver}.tar.gz"
        "yt2.patch")
sha256sums=('effb00536f19fd2bdc18f67dacd5550b82066a6adce5b928f27a01d7505109ec'
            '91ef328fa1be9ced31a2af0edc7a95d364747f7812c9a29911acc44a777c3202')

prepare() {
    cd "$srcdir/${_module_name}-$pkgver"
    patch -Np1 -i ../../yt2.patch

}

package() {
  cd "$srcdir/${_module_name}-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 COPYING.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  cd $pkgdir/usr/bin
  mv iyt iyt2
}
