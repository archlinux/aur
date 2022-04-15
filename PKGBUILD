# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=ognibuild
pkgver=0.0.13
pkgrel=2
pkgdesc="Detect and invoke build systems"
arch=('any')
url="https://jelmer.uk/code/ognibuild"
#url="https://github.com/jelmer/ognibuild"
license=('GPL2')
depends=('breezy' 'python-buildlog-consultant' 'python-requirements-parser'
         'python-setuptools' 'python-toml')
makedepends=('python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc})
sha256sums=('15d05c36c555b68101ba68a6659f09cdea6a25e06cd4d455dbaecb78bff94cbe'
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
