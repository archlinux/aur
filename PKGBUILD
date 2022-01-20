# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=twitch-dl
pkgver=1.17.1
pkgrel=1
pkgdesc="Twitch video downloader that use multiple concurrent connections"
arch=(any)
url="https://github.com/ihabunek/twitch-dl"
license=('GPL3')
depends=('python' 'python-m3u8>=1.0.0' 'python-requests' 'ffmpeg')
makedepends=('python-setuptools' 'python-wheel')
optdepends=('twine')
checkdepends=('python-pytest')
provides=('twitch-dl-bin')
conflicts=('twitch-dl-bin')
source=($url/archive/$pkgver.tar.gz)
b2sums=('55b775e598fde29a41ffafedeb37b5952d18e8a947f7a10aee6227b45924236057fead7129eca2360f761135f69d8dd8a5facffac86e30d7b62125d74ab5e7f7')

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
