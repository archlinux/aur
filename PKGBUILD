# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Xyne <ac xunilhcra enyx, backwards>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: cs-cam - me.at.camdaniel.com
# Contributor: Sebastien Piccand <sebcactus gmail com>

pkgname=grimripper-git
pkgver=3.0.0.r8.g53011c9
pkgrel=1
pkgdesc="a graphical CD ripper and encoder, Gtk3 fork from GNOME"
arch=(x86_64)
url="https://gitlab.gnome.org/Salamandar/GrimRipper"
license=(GPL2)
depends=(gtk3 libcddb cdparanoia)
makedepends=(git meson ninja intltool)
optdepends=('lame: for mp3 support'
            'vorbis-tools: for ogg support'
            'fdkaac: for mp3 support'
            'flac: for flac support'
            'opus-tools: for opus support'
            'wavpack: for wavpack support'
            'musepack-tools: for musepack support'
            'mac: for monkey audio support')
provides=(grimripper)
conflicts=(grimripper)
source=("git+https://gitlab.gnome.org/Salamandar/GrimRipper.git")
sha512sums=('SKIP')

pkgver() {
  cd GrimRipper
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd GrimRipper
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd GrimRipper
  DESTDIR="${pkgdir}" ninja -C build install
}
