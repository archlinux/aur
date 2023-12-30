# Maintainer: GreyXor <greyxor@protonmail.com>
# Contributor: Taran Lynn <taranlynn0gmail.com>
pkgname=swaybg-git
pkgver=1.2.0.r4.geabc06e
pkgrel=1
pkgdesc="Wallpaper tool for Wayland compositors (git development version)"
arch=('x86_64')
url="https://github.com/swaywm/swaybg"
license=("MIT")
depends=(
"cairo"
"gdk-pixbuf2"
"glib2"
"glibc"
"wayland"
)
makedepends=(
'meson'
"git"
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
