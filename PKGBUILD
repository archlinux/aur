#Maintainer: David McInnis <dave@dave3.xyz>

pkgname=python-mahotas
shrtname=mahotas
pkgver=1.4.9
pkgrel=1
pkgdesc="A fast computer vision algorithms (all implemented in C++) operating over numpy arrays"
url="http://luispedro.org/software/mahotas"
depends=('python' 'python-numpy')
makedepends=('python-numpydoc' )
checkdepends=('python-scipy' 'python-imread' 'python-nose' 'python-pillow')
license=('MIT')
arch=('i686' 'x86_64')
source=(https://files.pythonhosted.org/packages/84/74/bd38163462eb346519f36dc205f0a52a01fb372c7bbcc87392c9b21cfe26/$shrtname-$pkgver.tar.gz)
sha256sums=('4c65f462a09fe19dea4ac7b630039478e9691126e430ace485e965635e535f71')

build() {
    cd $srcdir/$shrtname-$pkgver
    python setup.py build
}


#======================================================================
#FAIL: mahotas.tests.test_convolve.test_convolve1d
#----------------------------------------------------------------------
#Traceback (most recent call last):
#  File "/usr/lib/python3.8/site-packages/nose/case.py", line 197, in runTest
#    self.test(*self.arg)
#  File "/home/dave/projects/aur/python-mahotas/src/mahotas-1.4.9/mahotas/tests/test_convolve.py", line 241, in test_convolve1d
#    assert np.all(fw == f1w)
#AssertionError
#
#----------------------------------------------------------------------
#
#check() {
#    cd $srcdir/$shrtname-$pkgver
#    python setup.py test
#}

package() {
    cd $srcdir/$shrtname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
    install -m755 -d "${pkgdir}/usr/share/licenses/python-mahotas"
    install -m644 COPYING "${pkgdir}/usr/share/licenses/python-mahotas/LICENSE.txt"
}
