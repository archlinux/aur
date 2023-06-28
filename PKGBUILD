# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Ricardo Liang (rliang) <ricardoliang@gmail.com>

_pkgname=gnome-disk-utility
pkgname="${_pkgname}-git"
pkgver=44.0+9+ga2211415
pkgrel=1
pkgdesc="Disk Management Utility for GNOME"
url="https://gitlab.gnome.org/GNOME/${_pkgname}"
arch=(x86_64)
license=(GPL)
provides=("${_pkgname}=${pkgver}"
          "gnome-disks")
conflicts=("${_pkgname}"
           "gnome-disks")
depends=(
  gtk3
  libcanberra
  libdvdread
  libhandy
  libnotify
  libpwquality
  libsecret
  parted
  systemd
  udisks2
)
makedepends=(
  docbook-xsl
  git
  meson
)
groups=(
  gnome
  gnome-git)
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson "${_pkgname}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}"
}

# vim:set sw=2 sts=-1 et:
