# Maintainer: James Denholm <nod.helm@gmail.com>
pkgname=python-evelink
pkgver=0.7.0
pkgrel=1
pkgdesc="Python bindings for the EVE API."
arch=('any')
url="https://github.com/eve-val/evelink"
license=('MIT')
depends=('python' 'python-six')
makedepends=('git')
options=()
source=("git+https://github.com/eve-val/evelink.git#tag=$pkgver")
sha256sums=('SKIP')

_gitname=evelink

package() {
  cd "$srcdir/$_gitname"
  #Remove setup.py's handling of README.md, LICENSE, and bin/evelink
  sed -i '33,35d;36d' setup.py
  python setup.py install --root="$pkgdir/" --optimize=1

  #Manually deal with the LICENSE file.
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
