# Maintainer: Ysblokje <ysblokje at gmail dot com>
pkgname=('gamemode')
pkgver=1.2
pkgrel=2
pkgdesc="A daemon/lib combo for Linux that allows games to request a set of optimisations be temporarily applied to the host OS."
arch=('x86_64')
url="https://github.com/FeralInteractive/gamemode.git"
license=('BSD 3-Clause License (Revised)')
optdepends=('systemd')
depends=('polkit')
makedepends=('meson' 'ninja' 'pkg-config' 'git')
provides=('gamemode')
source=("https://github.com/FeralInteractive/gamemode/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('a7b8d63ffdcbea0dc8b557fda42a9471fa9ab0961a5450d2a15cccca0aaf6a95')

build() {
  arch-meson gamemode-$pkgver build -Dwith-systemd-user-unit-dir=/usr/lib/systemd/user
  ninja -C build
}

package() {
  DESTDIR=$pkgdir ninja -C build install
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" ${pkgname}-${pkgver}/LICENSE.txt
  install -m644 -Dt "${pkgdir}/usr/share/doc/${pkgname}/example" ${pkgname}-${pkgver}/example/gamemode.ini
}

