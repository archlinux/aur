# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=twitch-dl
pkgver=1.22.0
pkgrel=2
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
b2sums=('5b5163541b37aa2ef0c786cb8522a396b9ec5e7ccda7ae5388034d136d6e51676cf843f768c14ea27724be5c3f523de119aca5f53dbebb2365c27e547c1639bb')

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
