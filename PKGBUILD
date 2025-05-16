# Maintainer: Haoyang Liu <tttturtleruss@gmail.com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=twitch-dl-git
pkgver=3.1.0.r0.g79ef07e
pkgrel=1
pkgdesc="Twitch video downloader that use multiple concurrent connections"
arch=(any)
url="https://github.com/ihabunek/twitch-dl"
license=('GPL-3.0-only')
depends=('python' 'python-httpx' 'python-click' 'python-m3u8')
makedepends=('git' 'python-build' 'python-installer')
optdepends=('twine: Collection of utilities for interacting with PyPI')
checkdepends=('python-pytest')
provides=('twitch-dl' 'twitch-dl-bin')
conflicts=('twitch-dl' 'twitch-dl-bin')
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  make 
}

package() {
  cd "${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
