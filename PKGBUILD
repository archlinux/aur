pkgname=stl2pov
pkgver=3.1
pkgrel=3
pkgdesc="generate a POVray mesh or a PostScript or PDF view from an STL file"
arch=('any')
url="http://rsmith.home.xs4all.nl/software/py-stl-stl2pov.html"
license=(BSD)
depends=('python2')
optdepends=('python2-cairo: for stl2pdf support')
provides=('stl2ps' 'stl2pdf')
conflicts=('stl2ps' 'stl2pdf')
options=(!emptydirs)
source=("http://rsmith.home.xs4all.nl/static/files/py-stl-${pkgver}.zip")
sha256sums=('d5a2eccbd627d05b28d3b6d619202d3a55b4d94dbf21a63b68109688ebc8e929')

build() {
  cd "$srcdir/py-stl-$pkgver"
  # the limit truncates valid vectors to 0 and raises errors... increase it
  sed -i 's/LIMIT = 1e-7/LIMIT = 1e-40/' -- stl.py
}

package() {
  cd "$srcdir/py-stl-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
