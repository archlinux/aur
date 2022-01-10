# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=twitch-dl
pkgver=1.17.0
pkgrel=2
pkgdesc="Twitch video downloader that use multiple concurrent connections"
arch=(any)
url="https://github.com/ihabunek/twitch-dl"
license=('GPL3')
depends=('python' 'python-m3u8' 'python-requests' 'ffmpeg')
makedepends=('python-setuptools' 'python-wheel')
optdepends=('twine')
checkdepends=('python-pytest')
provides=('twitch-dl-bin')
conflicts=('twitch-dl-bin')
source=($url/archive/$pkgver.tar.gz)
b2sums=('91b955ef0dd23308ebe8ccf274d04cb7b1b210099c168f26774c02f3c5c4377bdef45fda4baa73290aae19f5b34cfaa4860770d1389d5000e981b7efb879c6ab')

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
