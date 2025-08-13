# Maintainer: Jian Qiang Wu <Qiangwu2000@gmail.com>
pkgname=wlsbg
pkgver=3.3.7
pkgrel=1
pkgdesc="Wallpaper tool with shader support for Wayland compositors"
arch=("x86_64")
url="https://github.com/Sublimeful/wlsbg"
license=("MIT")
depends=(
  "wayland"
  "mesa"
  "glib2"
  "glibc"
  "mpv"
  "fftw"
)
makedepends=(
  "meson"
  "wayland-protocols"
  "scdoc"
  "git"
)
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}::git+${url}.git")
b2sums=("SKIP")

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dm644 "${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -Dm644 "${pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
