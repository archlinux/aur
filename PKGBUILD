# Maintainer: SoftExpert <softexpert at gmail dot com>

_pkgname=xinput-gtk
pkgname=xinput-gtk-git
pkgver=r6.ge672fac
pkgrel=1
pkgdesc='xinput-gtk is a GTK3 frontend for Xorg XInput'
arch=('x86_64')
url='https://github.com/mehedirm6244/xinput-gtk/'
license=('GPL-3.0-or-later')
depends=('atkmm' 'gcc-libs' 'glib2' 'glibc' 'glibmm' 'gtk3' 'libsigc++' 'xorg-xinput' 'gtkmm3')
makedepends=('cmake' 'git')
optdepends=()
provides=('xinput-gtk')
conflicts=('xinput-gtk' 'xinput-gtk-git')
source=("xinput-gtk::git+https://github.com/mehedirm6244/xinput-gtk.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build
  cmake ..
  cmake --build . -j 4
}

package() {
  cd "${_pkgname}/build"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim: ts=2 sw=2 et:
