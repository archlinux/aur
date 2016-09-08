pkgname=transi2p
pkgver=1.2.3
pkgrel=1
pkgdesc="Transparent proxy for i2p."
arch=('any')
url="https://pypi.python.org/pypi/transi2p"
license=('BSD')
depends=('python2-twisted' 'txi2p')
options=('!emptydirs')
source=("https://pypi.python.org/packages/source/t/transi2p/transi2p-${pkgver}.tar.gz")
sha256sums=('670eeee9fccf740b25b32174e89f3d84c7411fb7b6d8ee3454ac7f84eea57a80')
prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # argparse is part of python 2.7+, so we can remove it from install_requires
  sed -i "/'argparse',/d" setup.py
  
  find . -type f \( -name '*.py' -or -executable \) -exec \
    sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
           -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
           \{\} + 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
