# Maintainer: Ben 'silentnoodle' Lönnqvist <lonnqvistben at gmail dot com>
pkgname=planarally-bin
pkgver=0.28.0
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

sha256sums=('ddae926a91f05c74dfc442268ac37e9ac2b2e8471399514d790124ccc71afd06')

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

