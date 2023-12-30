# Maintainer: GreyXor <greyxor@protonmail.com>
# Contributor: Justine Smithies <justine AT smithies DOT me DOT uk>
# Contributor: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: gilbus <aur(AT)tinkershell.eu>
pkgname=swayidle-git
pkgver=1.8.0.r10.g61d653f
pkgrel=1
pkgdesc="Idle management daemon for Wayland (git development version)"
arch=('x86_64')
url="https://github.com/swaywm/swayidle"
license=("MIT")
depends=(
"wayland"
"systemd-libs"
"glibc"
)
makedepends=(
"git"
"meson"
"scdoc"
"wayland-protocols"
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
