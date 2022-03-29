# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=ognibuild
pkgver=0.0.12
pkgrel=1
pkgdesc="Detect and invoke build systems"
arch=('any')
url="https://jelmer.uk/code/ognibuild"
#url="https://github.com/jelmer/ognibuild"
license=('GPL2')
depends=('breezy' 'python-buildlog-consultant' 'python-requirements-parser'
         'python-setuptools' 'python-toml')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc})
sha256sums=('3eec3f26bfeaaf0aa28487b694230abdf6ea40a1feefb1c1186031fc24e2d8a7'
            'SKIP')
validpgpkeys=('DC837EE14A7E37347E87061700806F2BD729A457') # Jelmer Vernooĳ <jelmer@jelmer.uk>

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Remove Debian-specific binaries
  rm "$pkgdir"/usr/bin/{deb-fix-build,report-apt-deps-status}
}
