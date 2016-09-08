pkgname=txi2p
pkgver=0.3
pkgrel=1
pkgdesc="I2P bindings for Twisted"
arch=('any')
url="https://pypi.python.org/pypi/transi2p"
license=('BSD')
depends=('python2-twisted' 'python2-parsley')
options=('!emptydirs')
source=("https://pypi.python.org/packages/5a/4e/4d4c54cb8b6a7dfbc8cd61906d1bcdce189a1785f5de3733b0047ae0a072/txi2p-${pkgver}.tar.gz")
md5sums=('0b588f65337124d05d111a4f88394051')
prepare() {
  cd "$srcdir/txi2p-$pkgver"

  # argparse is part of python 2.7+, so we can remove it from install_requires
  sed -i "/'argparse',/d" setup.py
  
  find . -type f \( -name '*.py' -or -executable \) -exec \
    sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
           -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
           \{\} + 
}

package() {
  cd "$srcdir/txi2p-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
