# Maintainer: Levente Polyak <anthraxx@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# shellcheck disable=all

pkgname=i3-doubleborders
pkgver=4.23
pkgrel=1
pkgdesc='Improved dynamic tiling window manager'
arch=('x86_64')
url=https://i3wm.org
license=('BSD')
groups=('i3')
depends=('libev' 'libxkbcommon-x11' 'pango' 'startup-notification'
         'xcb-util-cursor' 'xcb-util-keysyms' 'xcb-util-wm' 'xcb-util-xrm'
         'yajl')
makedepends=('meson' 'xmlto')
optdepends=('dmenu: for the default program launcher'
            'rofi: for a modern dmenu replacement'
            'i3lock: for the default screen locker'
            'xss-lock: for the default screen locker'
            'i3status: for the default status bar generator'
            'perl: for i3-save-tree and i3-dmenu-desktop'
            'perl-anyevent-i3: for i3-save-tree'
            'perl-json-xs: for i3-save-tree')
replaces=('i3' 'i3bar' 'i3-gaps')
provides=('i3-wm')
conflicts=('i3-wm')
backup=('etc/i3/config')
source=("$url/downloads/i3-$pkgver.tar.xz"{,.asc}
        "https://gist.githubusercontent.com/HeCodes2Much/b7111e9028cdfb3e6c60614cdfd19875/raw/178d5273fa91dcf6ed03d96187e78e841c814f35/x.diff")
b2sums=('3a5179d5b468ae66f81e53ee8376eb82d4f5d9441d1488f3f761fcad9d68b739fa963f4985db7448e5049983b8cf26ae3fa6bdac32c8677f0384f059cd9db507'
        'f0450e57e031f11e6b2d0404abd849015fc100a96252d29be7cf05e855e47e7d6100891ae1c0fa0a293901dd2bbb93bc4a6318784023dd366fd1aaaed5d9a606'
        'c2257a564975f4649ec275587dea790cfed8dd0e3e6ee69f6ee60ac3f638d0510d930c74cd2cb6dfc15f4591c2ae9fe1b1d9f84f23967e1992f93a91b91cd301')
validpgpkeys=('424E14D703E7C6D43D9D6F364E7160ED4AC8EE1D') # Michael Stapelberg <michael@stapelberg.de>

prepare() {
  cd i3-$pkgver
  patch -Np1 -i ../x.diff
}

build() {
  cd i3-$pkgver
  arch-meson build
  ninja -C build
}

package() {
  cd i3-$pkgver
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et: