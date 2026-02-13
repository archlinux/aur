# shellcheck shell=bash
# -*- sh -*-
# MAintainer: Amro Emad <korialo001 at gmail dot com>
# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: loserMcloser <reebydobalina@gmail.com>

pkgname=python-textual-image
_pkgname=textual-image
pkgver=0.8.5
pkgrel=2
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
source=("$_pkgname-$pkgver.tar.gz::https://github.com/lnqs/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
license=('LGPL-3.0-only')
sha256sums=('6081a6699406919bc398c6f1d5ed3955adeb5fd25cbe802adc4344ee6d20c8e1')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  pytest 
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
}

# eof
