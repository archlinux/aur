# Maintainer: Leandro Guedes <leanguedes at icloud dot com>

pkgname=libretro-gearsystem
pkgver=1241
pkgrel=1
pkgdesc='Sega Master System/Game Gear/SG-1000 core'
arch=(x86_64)
url=https://github.com/drhelius/Gearsystem
license=(GPL-3.0-or-later)
groups=(libretro)
depends=(libretro-core-info)
makedepends=(git)
_commit=572693112ca3a59525f4161bc0b25e7f632319ca
source=("${pkgname}::git+https://github.com/drhelius/Gearsystem.git#commit=${_commit}")
sha256sums=('451946566bc68484ce0109835ce82ca2eb445ac97b6e0370060e93d63893c419')

pkgver() {
  cd "$pkgname"
  git rev-list --count HEAD
}

build() {
  make -C "${pkgname}/platforms/libretro"
}

package() {
  cd "$pkgname"
  install -Dm644 platforms/libretro/gearsystem_libretro.so -t "${pkgdir}/usr/lib/libretro/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim: ts=2 sw=2 et:
