# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=raider-file-shredder
pkgver=1.1.1
pkgrel=1
pkgdesc="Securely delete your files"
arch=('x86_64' 'aarch64')
url="https://github.com/ADBeveridge/raider"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'blueprint-compiler')
optdepends=('libnautilus-extension')
checkdepends=('appstream-glib')
conflicts=("${pkgname%-file-shredder}")
source=($url/archive/v$pkgver.tar.gz)
b2sums=('537cbfe062bde85e00831fbf3aa88bcd23a1b99191640038c2cdee50d59596581afecda8275c4ba467056767e26abd28c5c2fc34bddbd5bd58e23780883134ae')

build() {
  arch-meson "${pkgname%-file-shredder}-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
