# Maintainer: GreyXor <greyxor@protonmail.com>
# Contributor: Primalmotion <primalmotion@pm.me>
# Contributor: gilbus <aur@tinkershell.eu>
pkgname=swaylock-git
pkgver=1.7.2.r18.g91bb968
pkgrel=1
pkgdesc='Screen locker for Wayland (git development version)'
arch=('x86_64')
url="https://github.com/swaywm/swaylock"
license=("MIT")
depends=(
"cairo"
"gdk-pixbuf2"
"glib2"
"glibc"
"pam"
"wayland"
"libxkbcommon"
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
