# Contributor: Gour <gour@gour-nitai.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=bibstuff  
pkgver=1.3.102
pkgrel=2
pkgdesc="Collection of python2 scripts and modules for interacting with BibTeX style databases of citation references"
url="http://dschwilk.github.io/bibstuff"
arch=('any')
license=('MIT')
depends=('python2-simpleparse')
makedepends=('git')
source=(git+https://github.com/dschwilk/bibstuff#commit=17036096234206f32531747e326af2ca57b48d38)
md5sums=('SKIP')

prepare() {
  cd $pkgname
  find . -name "*.py" -exec sed -i '1s+python+python2+' {} \;
}
  
package() {
  cd $pkgname
  python setup.py install --root="$pkgdir"

  # copying license information
  install -D -m644 license.txt "$pkgdir"/usr/share/licenses/$pkgname/license.txt

  # copying readme information
  install -Dm644 README.rst "$pkgdir"/usr/share/doc/$pkgname/README.rst

  # copying examples directory
  install -d "$pkgdir"/usr/share/doc/$pkgname/examples
  cp examples/* "$pkgdir"/usr/share/doc/$pkgname/examples
}
