# Maintainer: kochan <bifadea02 at disroot dot org>

pkgname=crossplane
pkgver=0.5.8
pkgrel=2
pkgdesc="Reliable and fast NGINX configuration file parser"
arch=('x86_64')
url="https://github.com/nginxinc/crossplane"
license=('Apache-2.0')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-tox' 'pypy')

source=("https://github.com/nginxinc/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e4992f267b3fd6318334140a842131daa37124f6d0c4f9300c836d21949ec70e')

check() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m tox
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"
  mkdir -p "$pkgdir"/usr/share/{doc/"$pkgname",licenses/"$pkgname"}
  install -Dm644 AUTHORS.rst  README.md "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE NOTICE "$pkgdir/usr/share/licenses/$pkgname"
}
