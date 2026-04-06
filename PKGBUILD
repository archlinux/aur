# shellcheck shell=bash
# -*- sh -*-
# MAintainer: Amro Emad <korialo001 at gmail dot com>
# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: loserMcloser <reebydobalina@gmail.com>

pkgname=python-textual-image
_pkgname=textual-image
pkgver=v0.9.0
_pkgver=${pkgver#v*}
pkgrel=1
pkgdesc="Render images in the terminal with Textual and Rich"
arch=('any')
url="https://github.com/lnqs/textual-image"
depends=(
  'python'
  'python-pillow'
  'python-textual'
  'python-rich'
  'python-typing_extensions'
)
makedepends=(
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
source=("$_pkgname-$pkgver.tar.gz::https://github.com/lnqs/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
license=('LGPL-3.0-only')
sha256sums=('b65bd5c71455c565c5a50cd8202a1e53728169d8cd9b4a2a34604ee9b3350058')

build() {
  cd "$_pkgname-$_pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$_pkgver"
  pytest 
}

package() {
  cd "$_pkgname-$_pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
}

# eof
