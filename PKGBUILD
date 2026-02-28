# Maintainer: Mark Karlinsky <mark.devnull@gmail.com>
# Contributor: GreyXor <greyxor@protonmail.com>
# Contributor: Justine Smithies <justine AT smithies DOT me DOT uk>
# Contributor: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: gilbus <aur(AT)tinkershell.eu>
pkgname=swayidle-nologind
pkgver=1.9.0
pkgrel=1
pkgdesc="Idle management daemon for Wayland (without [e]logind integration)"
arch=('x86_64')
url="https://github.com/swaywm/swayidle"
license=("MIT")
depends=(
"wayland"
"glibc"
)
makedepends=(
"git"
"meson"
"scdoc"
"wayland-protocols"
)
provides=("swayidle=$pkgver")
conflicts=("swayidle")
_tag=5d94dff3dcca741a9a81c1feb1fd790f3904a990 # git rev-parse v${pkgver}
source=("$pkgname::git+${url}.git#tag=${_tag}")
sha256sums=('8451569ab48eb24286281c5f5e124a6d68ed1008b7911426b0f5521df03adf29')

build() {
  arch-meson "$pkgname" build -Dlogind=disabled
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
