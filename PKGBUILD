# Maintainer: Erhad Husovic <xdaemonx[at]protonmail[dot]ch>
# Maintainer: Jose Lopes <josemslopes at gmail dot com>

_pkgname=blink-qt
pkgname=blink
pkgver=5.5.1
pkgrel=2
pkgdesc='Fully featured, easy to use SIP client with a Qt based UI'
arch=('aarch64' 'x86_64')
url='https://icanblink.com'
license=('GPL-3+')
makedepends=('python-build' 'python-installer' 'python-wheel')
depends=(
  'icu72'
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
	'866dd26e3e729e1f4b7072e8a6d03f71b676a9191036f266c6243ea12c33d92b6a497509ca7c7d96bf46dd069bebe611b122107f89133aa141a992057bd43e13'
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
