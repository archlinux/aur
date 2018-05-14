# Maintainer: Ysblokje <ysblokje at gmail dot com>
pkgname=('gamemode')
pkgver=1.1
pkgrel=1
pkgdesc="A daemon/lib combo for Linux that allows games to request a set of optimisations be temporarily applied to the host OS."
arch=('x86_64')
url="https://github.com/FeralInteractive/gamemode.git"
license=('BSD 3-Clause License (Revised)')
optdepends=('systemd')
depends=('polkit')
makedepends=('meson' 'ninja' 'pkg-config' 'git')
provides=('gamemode')
source=("$pkgname-$pkgver::git+https://github.com/FeralInteractive/gamemode.git#tag=$pkgver")
#source=("$pkgname-$pkgver.tar.gz::https://github.com/FeralInteractive/gamemode/archive/$pkgver.tar.gz")
#sha256sums=('1758c764f672c5ad13283521586dcdab82e049f0d40f16631c34eb794cb1c349')
sha256sums=('SKIP')

build() {
  arch-meson gamemode-$pkgver build -Dwith-systemd-user-unit-dir=/usr/lib/systemd/user
  ninja -C build
}

package() {
  DESTDIR=$pkgdir ninja -C build install
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" ${pkgname}-${pkgver}/LICENSE.txt
}

