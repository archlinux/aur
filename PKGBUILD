# shellcheck shell=bash
# -*- sh -*-
# Maintainer: Amro Emad <korialo001 at gmail dot com>
# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: loserMcloser <reebydobalina@gmail.com>

pkgname=python-textual-image
_pkgname=textual-image
pkgver=0.14.4
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
  'python-build'
  'python-installer'
  'python-wheel'
  'python-uv-build>=0.11'
)
checkdepends=(
  'python-pytest'
  'python-pytest-asyncio'
  'python-syrupy'
  'python-numpy'
)
source=("https://github.com/lnqs/textual-image/archive/refs/tags/v${pkgver}.tar.gz")
license=('LGPL-3.0-or-later')
sha256sums=('9bb4a08867e67828e54938a9f79232921cc1d89241f4144c334bf519998130cd')

build() {
  cd "${_pkgname}-${pkgver}"

  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}-${pkgver}"

  export PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
  export PYTEST_PLUGINS="pytest_asyncio.plugin,syrupy"
  pytest
}

package() {
  cd "${_pkgname}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
}

# eof
