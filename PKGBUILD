# Maintainer: GreyXor <greyxor@protonmail.com>
pkgname=libliftoff-git
pkgver=0.5.0.r1.g07fbf14
pkgrel=1
pkgdesc="Lightweight KMS plane library (git development version)"
arch=('x86_64')
url="https://gitlab.freedesktop.org/emersion/libliftoff"
license=("MIT")
depends=("libdrm"
"glibc")
makedepends=("git"
"meson"
"ninja"
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
