# Maintainer: Ysblokje <ysblokje at gmail dot com>
pkgname=('gamemode')
pkgver=1.5
pkgrel=1
pkgdesc="A daemon/lib combo for Linux that allows games to request a set of optimisations be temporarily applied to the host OS"
arch=('x86_64')
url="https://github.com/FeralInteractive/gamemode.git"
license=('BSD 3-Clause License (Revised)')
optdepends=('systemd')
depends=('polkit')
makedepends=('meson' 'ninja' 'pkg-config')
source=("https://github.com/FeralInteractive/gamemode/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('262389e0a625670c5f53f89d0c30a28cd5f9569a8e6b012dccf78b7fdcb98408')

build() {
  meson gamemode-$pkgver build --prefix /usr -Dwith-pam-group=gamemode -Dwith-systemd-user-unit-dir=/usr/lib/systemd/user
  #meson ${_pkgname} build --prefix /usr -Dwith-systemd-user-unit-dir=/usr/lib/systemd/user -Dwith-pam-group=gamemode
  ninja -C build
}

package() {
  DESTDIR=$pkgdir ninja -C build install
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" ${pkgname}-${pkgver}/LICENSE.txt
  install -m644 -Dt "${pkgdir}/usr/share/doc/${pkgname}/example" ${pkgname}-${pkgver}/example/gamemode.ini
}

