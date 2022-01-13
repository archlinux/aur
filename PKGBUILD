# Maintainer: bleak <bleaktradition@gmail.com>

pkgname=python-mattermostdriver
pkgver=7.3.1
pkgrel=2
pkgdesc="Python Mattermost Driver for APIv4"
arch=('any')
url="https://vaelor.github.io/python-mattermost-driver/"
license=('MIT')
depends=('python' 'python-requests' 'python-websockets')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Vaelor/python-mattermost-driver/archive/refs/tags/$pkgver.tar.gz"
        ssl_context.patch
)
_extracted_name="python-mattermost-driver"
sha256sums=('24f6f647bc6c5f3f44b2e9b37f4bc23499357db5f699fb7ddcc8a30e36e30041'
            '68cec4aa46ca460e913b6ff8e119b1fa338096d5b6b4caed32a2099ede0d2966')
sha512sums=('da0392df5cbb044f84ff1e8d53db7b229aacf26ad77fbafaeb649e407e0bc2e5425852283752ae4693f701e35ee20d434cf16aa542bc323af776ecaaf59a9bd7'
            '0ec877ad235124a3d2a992fadcbb59f434761db11e1969a1fd023ba275e619b7c0356d19433334f174c1f365adc1853a5ee0dc60981814455bf2370bb585f10b')

prepare() {
  patch -p1 "$_extracted_name-$pkgver/src/mattermostdriver/websocket.py" < ssl_context.patch
}

build() {
  cd "$_extracted_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_extracted_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:ts=2:sw=2:et:
