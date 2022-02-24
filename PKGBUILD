# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=ognibuild
pkgver=0.0.11
pkgrel=1
pkgdesc="Detect and invoke build systems"
arch=('any')
url="https://jelmer.uk/code/ognibuild"
#url="https://github.com/jelmer/ognibuild"
license=('GPL2')
depends=('breezy' 'python-buildlog-consultant' 'python-requirements-parser'
         'python-setuptools' 'python-toml')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc})
sha256sums=('ab9f61d3fe40f264c57d6c6b6fb9d398be98a8638d6775cec9ae300d727c698c'
            'SKIP')
validpgpkeys=('DC837EE14A7E37347E87061700806F2BD729A457') # Jelmer Vernooĳ <jelmer@jelmer.uk>

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Remove Debian-specific binary
  rm "$pkgdir/usr/bin/deb-fix-build"
}
