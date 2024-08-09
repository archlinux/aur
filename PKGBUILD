# Maintainer: neolouker <neolouker@gmail.com>
# Contributor: mechakotik <mechakotik@gmail.com>

pkgname=rog-daemon
pkgver=2.1.0
pkgrel=1
pkgdesc="Lightweight daemon and CLI to control ASUS ROG/TUF laptops features"
url="https://github.com/mechakotik/rog-daemon"
arch=('x86_64')
license=('GPL-3.0-or-later')

source=("${pkgname}-${pkgver}::https://github.com/mechakotik/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('ee5af3add536fded74af3282df72e1472fa65a090d1334bc850618fb8f7386d688f82efb7b33d41ed62338106a272d72b031f25cffd569eb3132c5fb65c325c1')

makedepends=(
    'gcc'
    'meson'
)

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  cd ${pkgname}-${pkgver}
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
