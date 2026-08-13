# Maintainer: ShinKouyo <i@0x0f.dev>

# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154

pkgname=fluent-icon-theme
_pkgname=Fluent-icon-theme
pkgver=20260727
_pkgver="${pkgver:0:4}-${pkgver:4:2}-${pkgver:6:2}"
pkgrel=1
pkgdesc='Fluent design icon theme'
arch=(any)
url='https://github.com/vinceliuice/Fluent-icon-theme'
license=('GPL-3.0-only')
depends=(
  hicolor-icon-theme
)
conflicts=("$pkgname-git")
options=('!strip')
source=("$url/archive/refs/tags/$_pkgver.tar.gz")
b2sums=('db7107417d8424b4cbe345228ef1c127a4bbe3ef2ee568c25be52017f7d5561ad4494c78086ad5f098e075bc2021e3aae87350c4175e5874d080164eaeeb4a41')

prepare() {
  cd "$_pkgname-$_pkgver" || exit 1
  sed -i '/gtk-update-icon-cache/d' install.sh
}

package() {
  cd "$_pkgname-$_pkgver" || exit 1
  install -d "$pkgdir/usr/share/icons"
  ./install.sh \
    --all \
    --dest "$pkgdir/usr/share/icons" \
    --name 'Fluent'
}
