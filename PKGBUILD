# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=gnome-remote-desktop
pkgname=$_pkgname-git
pkgver=0.1.6.0.g81ae42e
pkgrel=1
pkgdesc='Remote desktop daemon for GNOME using pipewire'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://wiki.gnome.org/Projects/Mutter/RemoteDesktop"
license=('GPL2')
depends=('dconf' 'libvncserver' 'libnotify' 'libsecret' 'pipewire')
makedepends=('git' 'meson')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git+https://gitlab.gnome.org/jadahl/$_pkgname.git
        0001-build-with-pipewire-0.2.2.patch)
sha512sums=('SKIP'
            'bd09b027a81557d143fb912f477bf60b98b4336eec8fdfe80fdef7e0cb1ed055f2ecd50cf370bab326349fbe4ee64c757e00a4a411e5779c8d5c47ef00a76445')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/^v//;s/-/./g;s/_/./g;'
}

build() {
  patch -d $_pkgname < 0001-build-with-pipewire-0.2.2.patch
  arch-meson $_pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
}

# vim:set ts=2 sw=2 et:
