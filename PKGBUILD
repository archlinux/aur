# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=twitch-dl
pkgver=2.3.0
pkgrel=1
pkgdesc="Twitch video downloader that use multiple concurrent connections"
arch=('any')
url="https://github.com/ihabunek/twitch-dl"
license=('GPL3')
depends=('python-httpx' 'python-m3u8' 'python-requests' 'python-pyaml' 'ffmpeg')
makedepends=('python-setuptools' 'python-wheel')
optdepends=('twine: Collection of utilities for interacting with PyPI')
checkdepends=('python-pytest')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
b2sums=('4ef237c48a57e555bf381b598bdaaa2ac1be9366f3b07b4fa71537b21b65a283af95cbdc4598d34e6443da5ccc690c6c9c77f9f5c87621c90ad905ec51600458')

build() {
  cd "$pkgname-$pkgver"
  make 
}

check(){
  cd "$pkgname-$pkgver"
  python setup.py pytest || :
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
