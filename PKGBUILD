# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=twitch-dl
pkgver=2.0.1
pkgrel=1
pkgdesc="Twitch video downloader that use multiple concurrent connections"
arch=('any')
url="https://github.com/ihabunek/twitch-dl"
license=('GPL3')
depends=('python' 'python-m3u8>=1.0.0' 'python-requests' 'python-pyaml' 'ffmpeg')
makedepends=('python-setuptools' 'python-wheel')
optdepends=('twine: Collection of utilities for interacting with PyPI')
checkdepends=('python-pytest')
provides=('twitch-dl-bin')
conflicts=('twitch-dl-bin')
source=($url/archive/$pkgver.tar.gz)
b2sums=('517d4604220e456fae83455346765e3c681b52f58f553e5e0b6a188a633920303358b2d3a23450a27cafc2c1d979f04316fa48cab99646877faad632e5a1ba35')

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
