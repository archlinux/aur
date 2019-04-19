# Maintainer: Ysblokje <ysblokje at gmail dot com>
pkgname=('gamemode')
pkgver=1.3.1
pkgrel=3
pkgdesc="A daemon/lib combo for Linux that allows games to request a set of optimisations be temporarily applied to the host OS"
arch=('x86_64')
url="https://github.com/FeralInteractive/gamemode.git"
license=('BSD 3-Clause License (Revised)')
optdepends=('systemd')
depends=('polkit')
makedepends=('meson' 'ninja' 'pkg-config')
source=("https://github.com/FeralInteractive/gamemode/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('fa0797ab61c255206ec90eec7d404b760ac92c932b6550296ced8686c532e67e')

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

