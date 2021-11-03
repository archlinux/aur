# Maintainer: Ben 'silentnoodle' Lönnqvist <silentnoodle at cock dot li>
pkgname=planarally-bin
pkgver=0.29.0
pkgrel=1
pkgdesc='A companion tool for when you travel into the planes.'
arch=('x86_64')
url='https://www.planarally.io'
license=('MIT')

depends=(
  'nodejs'
  'python'
  'python-aiohttp-jinja2'
  'python-aiohttp-security'
  'python-aiohttp-session'
  'python-jinja'
  'python-cryptography'
  'python-bcrypt'
  'python-socketio'
  'python-peewee'
  'python-typing_extensions'
)
makedepends=('npm')

makedepends=()
source=("https://github.com/Kruptein/PlanarAlly/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")

sha256sums=('7fd765984f77b8f82873e66517d4904835ac2d9b1204a1a5375f45839deae361')

prepare() {
  cd "$srcdir/server"
  sed -i '1s;^;#!/usr/bin/env python3\n;' planarserver.py
}

package() {
  install -dm655 "$pkgdir/usr/bin"
  install -dm655 "$pkgdir/opt/planarally"
  cp -r server "$pkgdir/opt/planarally/"
  ln -s "/opt/planarally/server/planarserver.py" "$pkgdir/usr/bin/planarally"
}

