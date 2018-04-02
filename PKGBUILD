# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=gnome-remote-desktop
pkgname=$_pkgname-git
pkgver=0.1.2.1.geceac8e
pkgrel=1
pkgdesc='Remote desktop daemon for GNOME using pipewire'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://wiki.gnome.org/Projects/Mutter/RemoteDesktop"
license=('GPL2')
depends=('libvncserver' 'dconf' 'pipewire')
makedepends=('git' 'meson')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git+https://gitlab.gnome.org/jadahl/$_pkgname.git
        0001-build-update-option-name-in-meson.build.patch)
sha512sums=('SKIP'
            '573202e85c4192ab567211a2378535018fdbdc1a58df19a4f5fd74c964b6d550d77f5666585df5039f31c1da0f836410c134b8609c9e099a6078f9640025d06b')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/^v//;s/-/./g;s/_/./g;'
}

build() {
  patch -d "$_pkgname" < 0001-build-update-option-name-in-meson.build.patch
  arch-meson $_pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
}

# vim:set ts=2 sw=2 et:
