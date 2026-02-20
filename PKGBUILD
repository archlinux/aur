# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=wljoywake
pkgver=0.3
pkgrel=2
pkgdesc='Wayland idle inhibit on joystick input'
arch=(x86_64)
url='https://github.com/nowrep/wljoywake'
license=(GPL-2.0-only)
depends=(wayland systemd-libs glibc)
makedepends=(meson wayland-protocols)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  wljoywake.service
  wljoywake.rules)
b2sums=('3086de8b5e2d25dea9fc01e88297d4f4e67c14bd4b914e721cf3435197e6893a171d89acc8e4a90457b3100b968a8dc11f992d49bda2f17375a3049d39999529'
        'afadeb0db12dd9c2f2d523ab63c4ee9ac2b4d3d10b9b24ad787e2fc740b8ba299f85883523caf5a669d73776f02bed31d8b9814235ed451ddb0f80e1f4aed8e5'
        '206b579afb71939bc5f70d9a498df410ce03965ca23e195e09da17c7a250a279eb27ba49fb199f9abeeafe8d6cccc6b6d22221d763c70057d1e311854ec16e99')

build() {
  arch-meson wljoywake-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 "wljoywake.service" "$pkgdir"/usr/lib/systemd/user/wljoywake.service
  install -Dm644 "wljoywake.rules" "$pkgdir"/usr/lib/udev/rules.d/99-wljoywake.rules
}

# vim:set ts=2 sw=2 et:
