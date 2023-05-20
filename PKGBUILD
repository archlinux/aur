# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>
# Fediverse: @fabiscafe@mstdn.social
# Contributor: Luna Jernberg <lunajernberg@gnome.org>
# Fediverse: @bittin@social.vivaldi.net

pkgname=tuba
pkgver=0.3.0
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
  gtk4
  libadwaita
  libgee
  libsoup3
  gtksourceview5
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
_commit=c11992a3acd510c9acfa46632a461fb25613b520 # tags/0.3.0^0
source=("git+https://github.com/GeopJr/Tuba.git#commit=$_commit")
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
