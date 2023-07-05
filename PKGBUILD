# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-slidge-git
pkgver=0.1.0alpha1.r1122.g1e9f9d0
pkgrel=1
pkgdesc='XMPP puppeteer gateway library in python'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://git.sr.ht/~nicoco/slidge"
license=('AGPL3')
depends=('python' 'python-slixmpp' 'python-aiohttp' 'python-qrcode' 'python-magic' 'python-configargparse' 'python-pillow' 'python-pickle-secure')
makedepends=('git' 'python-build' 'python-wheel' 'python-installer' 'python-setuptools')
provides=("python-slidge=$pkgver")
conflicts=('python-slidge')
source=('git+https://git.sr.ht/~nicoco/slidge')
sha256sums=('SKIP')

pkgver() {
  cd slidge
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd slidge
  python -m build --wheel --no-isolation
}

package() {
  cd slidge
  python -m installer --destdir="$pkgdir" dist/*.whl
}
