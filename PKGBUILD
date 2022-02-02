# Maintainer: bleak <bleaktradition@gmail.com>

pkgname=python-mattermostdriver
pkgver=7.3.2
pkgrel=1
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
sha256sums=('ccb0a1a85340ad8c04eb65c2a29714e15f9dc7fdb4ecd765b595f1118cb4c7e2'
            '68cec4aa46ca460e913b6ff8e119b1fa338096d5b6b4caed32a2099ede0d2966')
sha512sums=('0da6384dce40c3ee5332409e2b29de55c3d1431fa22b70dbe0f8c02df84c5ceb6291f24e4379e611d3ef636af5e171e9f95c20591796b1128e07cfc93bb8468b'
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
