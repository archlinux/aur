# Maintainer: FrankGeary contributors
#
# Binary AUR package for stable GitHub Release assets only.
# Do not point this package at GitHub Actions workflow artifacts; they expire,
# are not stable distribution assets, and are unsuitable for AUR users.
#
# Legacy ABI libraries for WebKitGTK 2.4 / webkitgtk-3.0, GMime 2.6, and
# Enchant 1.x are bundled in the release asset from a pinned Arch Linux Archive
# snapshot. Keep depends limited to current desktop integration/system packages.

pkgname=frank-geary-bin
pkgver=0.11.2_frank.1
pkgrel=5
pkgdesc='FrankGeary email client, prebuilt stable release binary'
arch=('x86_64')
url='https://github.com/akitaonrails/FrankGeary'
license=('LGPL2.1')
depends=(
  'desktop-file-utils'
  'gcr'
  'gtk3'
  'libcanberra'
  'libnotify'
  'libsecret'
  'libxml2'
  'sqlite'
  'hicolor-icon-theme'
)
provides=('geary' 'frank-geary')
conflicts=('geary' 'frank-geary')
# The release asset bundles a legacy shared-library closure that may already be
# stripped and usually has no separate debuginfo. Avoid makepkg debug indexing
# noise/failures such as "No debugging symbols" from gdb-add-index.
options=('!strip' '!debug')
_tag='v0.11.2-frank.1'
_asset='frank-geary-0.11.2_frank.1-x86_64.tar.zst'
source=("${_asset}::${url}/releases/download/${_tag}/${_asset}")
noextract=("${_asset}")
sha256sums=('cfdc2f186ce2b31dccb8eaced2180499e6f0675aeb63d1155d3bad95b494a354')

package() {
  bsdtar -xpf "${srcdir}/${_asset}" -C "${pkgdir}"
}
