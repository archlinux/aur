# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Fediverse: @fabiscafe@mstdn.social
# Contributor: Luna Jernberg <lunajernberg@gnome.org>
# Fediverse: @bittin@social.vivaldi.net

pkgname=tuba
pkgver=0.5.0
pkgrel=0.1
pkgdesc='Browse the Fediverse'
arch=(
  aarch64 #ALARM
  armv7h  #ALARM
  i686    #Arch Linux32
  x86_64  #Arch Linux
)
url='https://tuba.geopjr.dev/'
license=('GPL3')
depends=(
  dconf
  gdk-pixbuf2
  gspell
  gtk4
  gtksourceview5
  hicolor-icon-theme
  json-glib
  libadwaita
  libgee
  libsecret
  libsoup3
  libxml2
  pango
)
makedepends=(
  git
  meson
  vala
)

optdepends=(
  ## https://github.com/GeopJr/Tuba/issues/32#issuecomment-1483280966
  'webp-pixbuf-loader: calckey support (webp)'
)
_commit=f702912954387808e238a5421460a7598f4c1984 # tags/0.5.0^0
validpgpkeys=(
  ## curl -sS https://github.com/GeopJr.gpg | gpg --import -
  '04A92A61E5CE5342F40E48DCFE5185F095BFC8C9' #Evangelos Paterakis <evan@geopjr.dev>
  ## curl -sS https://github.com/web-flow.gpg | gpg --import -
  '5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23' #Github Web-Flow
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
