# Maintainer: Erhad Husovic <xdaemonx[at]protonmail[dot]ch>
# Maintainer: Jose Lopes <josemslopes at gmail dot com>

_pkgname=blink-qt
pkgname=blink
pkgver=5.2.0
pkgrel=1
pkgdesc='Fully featured, easy to use SIP client with a Qt based UI'
arch=('aarch64' 'x86_64')
url='https://icanblink.com'
license=('GPL-3+')
depends=(
  'icu'
  'libvncserver'
  'python-gevent'
  'python-gmpy2'
  'python-google-api-python-client'
  'python-oauth2client'
  'python-pyopenssl'
  'python-pyqt5'
  'python-service-identity'
  'python-sipsimple'
  'python-formencode'
  'python-sqlobject'
  'qt5-svg'
  'qt5-webkit'
  )
optdepends=('x11vnc: for screen sharing')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AGProjects/${_pkgname}/archive/${pkgver}.tar.gz")
b2sums=(
	'f414238e1266ac8c5a279d4810b69ff86839a3af5ce35ef6def25dfbae6372cde77c1906101196b2b6630e753134b93417e5045f2c80786b3fe2b139d18126dd'
)

build() {
  cd $_pkgname-$pkgver
  python3 setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # desktop file
  install -Dm644 "debian/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
