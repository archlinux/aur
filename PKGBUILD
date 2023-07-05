# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-aiosignald-git
pkgver=0.3.7.r0.gf10ceae
pkgrel=1
pkgdesc='Interact with the signal messaging network in python with sweet, sweet autocompletion'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://git.sr.ht/~nicoco/aiosignald"
license=('AGPL3')
depends=('python' 'signald')
makedepends=('git' 'python-build' 'python-wheel' 'python-installer' 'python-setuptools')
provides=("python-aiosignald=$pkgver")
conflicts=('python-aiosignald')
source=('git+https://git.sr.ht/~nicoco/aiosignald')
sha256sums=('SKIP')

pkgver() {
  cd aiosignald
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd aiosignald
  python -m build --wheel --no-isolation
}

package() {
  cd aiosignald
  python -m installer --destdir="$pkgdir" dist/*.whl
}
