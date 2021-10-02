# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=twitch-dl
pkgver=1.16.1
pkgrel=2
pkgdesc="Twitch video downloader that use multiple concurrent connections"
arch=(any)
url="https://github.com/ihabunek/twitch-dl"
license=('GPL3')
depends=('python' 'python-m3u8' 'python-requests' 'ffmpeg')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
provides=('twitch-dl-bin')
conflicts=('twitch-dl-bin')
source=($url/archive/$pkgver.tar.gz)
sha512sums=('830a9b0e9c378df755db17bc32d6c6973f3ec49a64b4985ae0bf0e429c4e3766226cb634d158ac3c351de03b64ea0c389785f25fae592047cbb8e48f0981ee8d')

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
