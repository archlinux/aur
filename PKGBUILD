# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

pkgname=gnome-remote-desktop
pkgver=0.1.6
pkgrel=1
pkgdesc='Remote desktop daemon for GNOME using pipewire'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://wiki.gnome.org/Projects/Mutter/RemoteDesktop"
license=('GPL2')
depends=('dconf' 'libvncserver' 'libnotify' 'libsecret' 'pipewire')
makedepends=('git' 'meson')
provides=("$pkgname")
conflicts=("$pkgname")
source=(https://gitlab.gnome.org/jadahl/gnome-remote-desktop/uploads/c6862c12f0b741714d5a27e0693322fe/gnome-remote-desktop-0.1.6.tar.xz
        0001-build-with-pipewire-0.2.2.patch)
sha512sums=('8a205ab8e8f42981a97c0cb2e28b5ed7ea7651cb87217b1667be8d9137037a0ca5d51e4e952db13e65cd6bf32f3bd2bf57bbe802ef896a344384739ac5e5e979'
            'cd8976acfd7722866d9ec937b7e97b8f02e2ea8602661ff68d6666439d738ecd09bae7be3bba019e061e60d583f9b2046e14d434c2d002c0b244d032b48e1525')

build() {
  patch -d "$pkgname-$pkgver" < 0001-build-with-pipewire-0.2.2.patch
  arch-meson $pkgname-$pkgver build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
}

# vim:set ts=2 sw=2 et:
