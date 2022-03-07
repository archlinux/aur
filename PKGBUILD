# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=twitch-dl
pkgver=1.21.0
pkgrel=1
pkgdesc="Twitch video downloader that use multiple concurrent connections"
arch=('any')
url="https://github.com/ihabunek/twitch-dl"
license=('GPL3')
depends=('python' 'python-m3u8>=1.0.0' 'python-requests' 'ffmpeg')
makedepends=('python-setuptools' 'python-wheel')
optdepends=('twine')
checkdepends=('python-pytest')
provides=('twitch-dl-bin')
conflicts=('twitch-dl-bin')
source=($url/archive/$pkgver.tar.gz)
b2sums=('c67967602f8d5b11001d4210f981a62d2f4c0f7ad5cb0ad25e99fd83b725e380cef48f9b515bfc8eadaac999be213a3c18fddd7331747ac9bc641b8d78a101f2')

build() {
  cd "$pkgname-$pkgver"
  make 
}

check(){
  cd "$pkgname-$pkgver"
  python setup.py pytest
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
