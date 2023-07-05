# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-pickle-secure-git
pkgver=0.99.9.r3.g8629331
pkgrel=1
pkgdesc='Wrapper around pickle that creates encrypted pickles'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/spapanik/pickle-secure"
license=('LGPL3')
depends=('python' 'python-cryptography')
makedepends=('git' 'python-build' 'python-wheel' 'python-installer' 'python-setuptools')
provides=("python-pickle-secure=$pkgver")
conflicts=('python-pickle-secure')
source=('git+https://github.com/spapanik/pickle-secure')
sha256sums=('SKIP')

pkgver() {
  cd pickle-secure
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd pickle-secure
  python -m build --wheel --no-isolation
}

package() {
  cd pickle-secure
  python -m installer --destdir="$pkgdir" dist/*.whl
}
