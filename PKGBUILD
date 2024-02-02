# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Luna Jernberg <lunajernberg@gnome.org>

pkgname=tuba
pkgver=0.6.3
pkgrel=0.1
pkgdesc='Browse the Fediverse'
arch=(
  aarch64 #ALARM
  armv7h  #ALARM
  i686    #Arch Linux32
  x86_64  #Arch Linux
)
url='https://tuba.geopjr.dev/'
license=('GPL-3.0-only')
depends=(
  dconf
  gdk-pixbuf2
  graphene
  gtk4
  gtksourceview5
  hicolor-icon-theme
  json-glib
  libadwaita
  libgee
  libsecret
  libsoup3
  libspelling
  libxml2
  pango
  webp-pixbuf-loader
)
makedepends=(
  git
  meson
  vala
)

optdepends=(
  'hunspell-de: German spellchecking dictionaries'
  'hunspell-el: Greek spellchecking dictionary'
  'hunspell-en_au: AU English spellchecking dictionaries'
  'hunspell-en_ca: CA English spellchecking dictionaries'
  'hunspell-en_gb: GB English spellchecking dictionaries'
  'hunspell-en_us: US English spellchecking dictionaries'
  'hunspell-es_any: Spanish (generic) spellchecking dictionary'
  'hunspell-es_ar: Spanish (Argentina) spellchecking dictionary'
  'hunspell-es_bo: Spanish (Bolivia) spellchecking dictionary'
  'hunspell-es_cl: Spanish (Chile) spellchecking dictionary'
  'hunspell-es_co: Spanish (Colombia) spellchecking dictionary'
  'hunspell-es_cr: Spanish (Costa Rica) spellchecking dictionary'
  'hunspell-es_cu: Spanish (Cuba) spellchecking dictionary'
  'hunspell-es_do: Spanish (Dominican Republic) spellchecking dictionary'
  'hunspell-es_ec: Spanish (Ecuador) spellchecking dictionary'
  'hunspell-es_es: Spanish (Spain) spellchecking dictionary'
  'hunspell-es_gt: Spanish (Guatemala) spellchecking dictionary'
  'hunspell-es_hn: Spanish (Honduras) spellchecking dictionary'
  'hunspell-es_mx: Spanish (Mexico) spellchecking dictionary'
  'hunspell-es_ni: Spanish (Nicaragua) spellchecking dictionary'
  'hunspell-es_pa: Spanish (Panama) spellchecking dictionary'
  'hunspell-es_pe: Spanish (Peru) spellchecking dictionary'
  'hunspell-es_pr: Spanish (Puerto Rico) spellchecking dictionary'
  'hunspell-es_py: Spanish (Paraguay) spellchecking dictionary'
  'hunspell-es_sv: Spanish (El Salvador) spellchecking dictionary'
  'hunspell-es_uy: Spanish (Uruguay) spellchecking dictionary'
  'hunspell-es_ve: Spanish (Venezuela) spellchecking dictionary'
  'hunspell-fr: French (classic/modern) spellchecking dictionaries'
  'hunspell-he: Hebrew spellchecking dictionary'
  'hunspell-hu: Hungarian spellchecking dictionary'
  'hunspell-it: Italian spellchecking dictionary'
  'hunspell-nl: Dutch spellchecking dictionaries'
  'hunspell-pl: Polish spellchecking dictionary'
  'hunspell-ro: Romanian spellchecking dictionary'
  'hunspell-ru: Russian spellchecking dictionary'
)

_commit=69d0a1531a0fc57489fd1bbaa1298988ec4d3747 # tags/0.6.3^0
validpgpkeys=(
  ## curl -sS https://github.com/GeopJr.gpg | gpg --import -
  '04A92A61E5CE5342F40E48DCFE5185F095BFC8C9' #Evangelos Paterakis <evan@geopjr.dev>
  ## curl -sS https://github.com/web-flow.gpg | gpg --import -
  '968479A1AFF927E37D1A566BB5690EEEBB952194' #Github Web-Flow
)
source=("git+https://github.com/GeopJr/Tuba.git#commit=${_commit}?signed")
sha256sums=('SKIP')

pkgver() {
  cd Tuba
  git describe --tags | sed -r 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd Tuba
}

build() {
  arch-meson Tuba build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  ln -s "/usr/bin/dev.geopjr.Tuba" "$pkgdir/usr/bin/tuba" 
}
