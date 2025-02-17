# Maintainer: Giorgi Taba K'obakhidze <t@gtk.ge>
# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-slidge-git
pkgver=0.1.0.r9.gc45818f
pkgrel=2
pkgdesc='XMPP puppeteer gateway library in python'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://codeberg.org/slidge/slidge"
license=('AGPL3')
depends=('python' 'python-slixmpp' 'python-aiohttp' 'python-qrcode' 'python-magic' 'python-configargparse' 'python-pillow' 'python-pickle-secure' 'python-blurhash')
makedepends=('git' 'python-build' 'python-wheel' 'python-installer' 'python-setuptools' 'python-poetry-core')
provides=("python-slidge=$pkgver")
conflicts=('python-slidge')
source=('git+https://codeberg.org/slidge/slidge')
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
