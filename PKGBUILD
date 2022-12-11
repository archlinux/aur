# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=ognibuild
pkgver=0.0.16
pkgrel=1
pkgdesc="Detect and invoke build systems"
arch=('any')
url="https://jelmer.uk/code/ognibuild"
#url="https://github.com/jelmer/ognibuild"
license=('GPL2')
depends=('breezy' 'python-buildlog-consultant' 'python-requirements-parser'
         'python-ruamel-yaml' 'python-setuptools' 'python-toml')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc})
sha256sums=('d594ae631b9621ac6753869a67b8cc2b7aaab62afa53db51a4de3d08a376a822'
            'SKIP')
validpgpkeys=('DC837EE14A7E37347E87061700806F2BD729A457') # Jelmer Vernooĳ <jelmer@jelmer.uk>

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Remove Debian-specific binaries
  rm "$pkgdir"/usr/bin/{deb-fix-build,report-apt-deps-status}
}
