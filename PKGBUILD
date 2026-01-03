# Maintainer: Erhad Husovic <xdaemonx[at]protonmail[dot]ch>
# Maintainer: Jose Lopes <josemslopes at gmail dot com>

_pkgname=blink-qt
pkgname=blink
pkgver=6.0.4
pkgrel=1
pkgdesc='Fully featured, easy to use SIP client with a Qt based UI'
arch=('aarch64' 'x86_64')
url='https://icanblink.com'
license=('GPL-3+')
makedepends=(
  'cython0'
  'python-build'
  'python-installer'
  'python-wheel'
  )
depends=(
  'icu'
  'libvncserver'
  'python-application'
  'python-eventlib'
  'python-gevent'
  'python-gmpy2'
  'python-google-api-python-client'
  'python-lxml'
  'python-lxml-html-clean'
  'python-oauth2client'
  'python-otr'
  'python-pgpy'
  'python-pyopenssl'
  'python-pyqt6'
  'python-pyqt6-webengine'
  'python-requests'
  'python-service-identity'
  'python-sipsimple'
  'python-sqlobject'
  'python-standard-imghdr'
  'python-twisted'
  'python-zope-interface'
  'qt6-svg'
  'qt6-webchannel'
  'qt6-webengine'
  )
optdepends=('x11vnc: for screen sharing')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AGProjects/${_pkgname}/archive/${pkgver}.tar.gz")
b2sums=(
	'04c1ec7ac2730b654a9c3c352d77b2fcbf5b9e4d00d693683804dd308580fc43eb651829be88df32039c83d7ac8fff7348e98e73a078bd206fa4c0b8a3c7c990'
)

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # desktop file
  install -Dm644 "debian/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
