# Maintainer: fgonzalezurriola <fgonzalezurriola@gmail.com>
pkgname=shaula
pkgver=0.1.6
pkgrel=1
pkgdesc='Capture, preview, save, and copy screenshots on Wayland'
arch=('x86_64' 'aarch64')
url='https://github.com/fgonzalezurriola/shaula'
license=('MIT')
depends=(
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk4'
  'gtk4-layer-shell'
  'hicolor-icon-theme'
  'json-glib'
  'pango'
  'wayland'
  'wl-clipboard'
  'xdg-desktop-portal'
)
makedepends=(
  'meson'
  'ninja'
  'pkgconf'
)
optdepends=(
  'grim: native capture on Niri and wlroots compositors'
  'niri: compositor-specific setup integration'
  'quickshell: Noctalia Shell integration'
  'ttf-geist: recommended UI font'
  'ttf-excalifont: recommended annotation font'
)
provides=('shaula')
conflicts=('shaula-bin')
install='shaula.install'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b13aeab25a47ace94d7900070aaab2f3b2bbf220fe8e4454aaf3289736727422')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  meson setup build --prefix=/usr --buildtype=release --strip -Db_lto=true
  meson compile -C build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" meson install -C build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
