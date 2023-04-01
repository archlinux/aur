# Maintainer: Erhad Husovic <xdaemonx[at]protonmail[dot]ch>
# Maintainer: Jose Lopes <josemslopes at gmail dot com>

_pkgname=blink-qt
pkgname=blink
pkgver=5.5.0
pkgrel=2
pkgdesc='Fully featured, easy to use SIP client with a Qt based UI'
arch=('aarch64' 'x86_64')
url='https://icanblink.com'
license=('GPL-3+')
depends=(
  'icu'
  'libvncserver'
  'python-application'
  'python-eventlib'
  'python-gevent'
  'python-gmpy2'
  'python-google-api-python-client'
  'python-lxml'
  'python-oauth2client'
  'python-pgpy'
  'python-pyopenssl'
#  'python-pyqt5' currently python-pyqt5-webkit provides python-pyqt5
  'python-pyqt5-webkit'
  'python-requests'
  'python-service-identity'
  'python-sipsimple'
  'python-formencode'
  'python-sqlobject'
  'python-twisted'
  'python-zope-interface'
  'qt5-svg'
  'qt5-webkit'
  )
optdepends=('x11vnc: for screen sharing')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AGProjects/${_pkgname}/archive/${pkgver}.tar.gz")
b2sums=(
	'3fca90bfd78e747c6bd3c46c7ca9a064b3bbd7fb44e51d79d2820f3a516783b499bb836e9620cbb4c3c2fb74dc475ab01f28840f71bc901c1a714bbbd16f1182'
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
