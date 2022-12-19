# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-gamepad
pkgver=0.0.2
_vdrapi=2.6.3
pkgrel=5
pkgdesc="Control VDR via a joystick device."
url="https://github.com/vdr-projects/vdr-plugin-gamepad"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/vdr-plugin-gamepad/archive/refs/tags/0.0.2.tar.gz")
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        "var/lib/vdr/plugins/$_plugname/keymap.txt")
sha256sums=('5563f60dea12c77fcdf6881ca9f3a77e085bad72f0a4540aa396514417fc499e')

build() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/vdr-plugin-${_plugname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
