# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=twitch-dl
pkgver=1.18.0
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
b2sums=('8a3e710f16d28fec37d80cc34b23a2645dce35827c417b6be65dbe34bbcd97f10ecc4e3d0bd0fa8024503c521c676e11d2f2c936d98884b86549897ccfb6818c')

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
