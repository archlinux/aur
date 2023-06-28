# Maintainer: Pellegrino Prevete(tallero) <pellegrinoprevete@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

_oldpkgname="gnome-tweak-tool"
_pkgname="gnome-tweaks"
pkgname="${_pkgname}-git"
pkgver=42.beta.r74.g8ef4ef3
pkgrel=1
pkgdesc="Graphical interface for advanced GNOME 3 settings (Tweak Tool)"
url="https://wiki.gnome.org/Apps/Tweaks"
arch=(any)
license=(GPL)
depends=(
  gnome-settings-daemon
  libhandy
  python-gobject
)
makedepends=(
  git
  meson
)
groups=(
  gnome-extra
  gnome-extra-git)
provides=(
  "${_oldpkgname}=${pkgver}"
  "${_oldpkgname}-git=${pkgver}"
  "${_pkgname}=${pkgver}"
)
conflicts=("${_pkgname}"
           "${_oldpkgname}")
replaces=("${_oldpkgname}")
source=("git+https://gitlab.gnome.org/GNOME/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
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
