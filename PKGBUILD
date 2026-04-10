# shellcheck shell=bash
# -*- sh -*-
# Maintainer: Amro Emad <korialo001 at gmail dot com>
# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: loserMcloser <reebydobalina@gmail.com>

pkgname=python-textual-image
_pkgname=textual-image
pkgver=0.11.0
pkgrel=1
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
  'python-setuptools'
)
checkdepends=(
  'python-pytest'
  'python-pytest-asyncio'
  'python-syrupy'
)
source=("git+https://github.com/lnqs/${_pkgname}#tag=v${pkgver}")
license=('LGPL-3.0-only')
sha256sums=('b7ac06829c6c12f2df6be1c842ef11497e45861aa8edb9b78d19da78a0463630')

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
