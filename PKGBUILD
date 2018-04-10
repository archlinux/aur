# Maintainer: Ysblokje <ysblokje at gmail dot com>
pkgname=('gamemode')
pkgver=1.0
pkgrel=3
pkgdesc="A daemon/lib combo for Linux that allows games to request a set of optimisations be temporarily applied to the host OS."
arch=('x86_64')
url="https://github.com/FeralInteractive/gamemode.git"
license=('BSD 3-Clause License (Revised)')
optdepends=('systemd')
depends=('polkit')
makedepends=('meson' 'ninja' 'pkg-config')
provides=('gamemode')
source=("https://github.com/FeralInteractive/gamemode/archive/$pkgver.tar.gz")
sha256sums=('bc458e294221e06b63edb286dd3dc1b541014941027198600959b27b11dd6a9d')

build() {
  arch-meson gamemode-$pkgver build -Dwith-systemd-user-unit-dir=/etc/systemd/user
  ninja -C build
}

package() {
  DESTDIR=$pkgdir ninja -C build install
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" ${pkgname}-${pkgver}/LICENSE.txt
}

