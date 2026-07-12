# Maintainer: AkitaOnRails <akitaonrails@users.noreply.github.com>
#
# Binary AUR package for stable GitHub Release assets only.
# Do not point this package at GitHub Actions workflow artifacts; they expire,
# are not stable distribution assets, and are unsuitable for AUR users.
#
# The asset is a meson release-profile install tree built against current
# Arch packages by .github/workflows/binary-release.yml, so depends must be
# kept in sync with the frank-geary source PKGBUILD.

pkgname=frank-geary-bin
pkgver=46.0_frank.2
pkgrel=1
pkgdesc='GNOME Geary email client with FrankGeary workflow improvements, prebuilt binary'
arch=('x86_64')
url='https://github.com/akitaonrails/frank_geary'
license=('LGPL-2.1-or-later')
depends=(
  'at-spi2-core'
  'cairo'
  'dconf'
  'enchant'
  'folks'
  'gcr'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gmime3'
  'gnome-online-accounts'
  'gsound'
  'gspell'
  'gtk3'
  'hicolor-icon-theme'
  'icu'
  'iso-codes'
  'json-glib'
  'libgee'
  'libgoa'
  'libhandy'
  'libpeas-2'
  'libsecret'
  'libsoup3'
  'libstemmer'
  'libunwind'
  'libxml2'
  'libytnef'
  'org.freedesktop.secrets'
  'pango'
  'sqlite'
  'webkit2gtk-4.1'
)
provides=('geary' 'frank-geary')
conflicts=('geary' 'frank-geary')
# The prebuilt asset ships no separate debuginfo; skip makepkg strip/debug
# indexing of binaries that were already produced by the release build.
options=('!strip' '!debug')
_tag="v${pkgver/_/-}"
_asset="frank-geary-${pkgver}-x86_64.tar.zst"
source=("${_asset}::${url}/releases/download/${_tag}/${_asset}")
noextract=("${_asset}")
sha256sums=('251b97866309dbfe9b9dfa867c4a78114bf443e75657fd82a25d5107cd27ce6b')

package() {
  bsdtar -xpf "${srcdir}/${_asset}" -C "${pkgdir}"
}
