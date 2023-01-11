# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=ognibuild
pkgver=0.0.17
pkgrel=1
pkgdesc="Detect and invoke build systems"
arch=('any')
#url="https://jelmer.uk/code/ognibuild"
url="https://github.com/jelmer/ognibuild"
license=('GPL2')
depends=('breezy' 'python-buildlog-consultant' 'python-requirements-parser'
         'python-ruamel-yaml' 'python-setuptools' 'python-toml')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('b0300a43dd7d75364736a78c4aa1c9d6101648164dbb31bc47c65788993568f7')
#validpgpkeys=('DC837EE14A7E37347E87061700806F2BD729A457') # Jelmer Vernooĳ <jelmer@jelmer.uk> (expired)

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Remove Debian-specific binaries
  rm "$pkgdir"/usr/bin/{deb-fix-build,deb-upstream-deps,report-apt-deps-status}
}
