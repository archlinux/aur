# Maintainer: Ysblokje <ysblokje at gmail dot com>
pkgname=('gamemode')
pkgver=1.0
pkgrel=1
pkgdesc="GameMode is a daemon/lib combo for Linux that allows games to request a set of optimisations be temporarily applied to the host OS."
arch=('x86_64')
url="https://github.com/FeralInteractive/gamemode.git"
license=('BSD 3-Clause License (Revised)')
depends=('systemd' 'polkit')
makedepends=('meson' 'ninja' 'pkg-config')
provides=('gamemode')
source=("https://github.com/FeralInteractive/gamemode/archive/$pkgver.tar.gz")
sha256sums=('bc458e294221e06b63edb286dd3dc1b541014941027198600959b27b11dd6a9d')

build() {
  cd gamemode-$pkgver
  meson --prefix=/usr build -Dwithsystemd-user-unit-dir=/etc/systemd/user
  cd build
  ninja
}

package() {
  cd gamemode-$pkgver/build
  DESTDIR=$pkgdir ninja install
}

