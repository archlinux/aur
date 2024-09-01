# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=prosystem-highscore-git
pkgver=1.5.2.r50.g56ec994
pkgrel=1
pkgdesc="Highscore port of ProSystem JG"
arch=('x86_64')
url="https://gitlab.com/alice-m/prosystem"
license=('GPL-2.0-or-later')
depends=('libhighscore-git')
makedepends=('git' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.com/alice-m/prosystem.git')
sha256sums=('SKIP')

pkgver() {
  cd prosystem
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd prosystem
  arch-meson highscore build
  meson compile -C build
}

package() {
  cd prosystem
  meson install -C build --destdir "$pkgdir"
}
