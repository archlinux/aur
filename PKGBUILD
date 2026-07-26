# shellcheck shell=bash
# -*- sh -*-
# Maintainer: Amro Emad <korialo001 at gmail dot com>
# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: loserMcloser <reebydobalina@gmail.com>

pkgname=python-textual-image
_pkgname=textual-image
pkgver=0.13.1
pkgrel=3
pkgdesc="Render images in the terminal with Textual and Rich"
arch=('any')
url="https://github.com/lnqs/textual-image"
depends=(
  'python>=3.12'
  'python-pillow'
  'python-textual'
  'python-rich'
  'python-typing_extensions'
)
optdepends=('python-numpy: sixel encoding optimization'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-hatchling'
)
checkdepends=(
  'python-pytest'
  'python-pytest-asyncio'
  'python-syrupy'
  'python-pytest-xdist'
)
source=("git+https://github.com/lnqs/${_pkgname}#tag=v${pkgver}")
license=('LGPL-3.0-only')
sha256sums=('67f5f45fe9059a3ffa34e73d7e02eac22f4f601cd3785d97f0d99e0958318e42')

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname"
  pytest 
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
}

# eof
