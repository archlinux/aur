# Maintainer: Reverier <reverier.xu@woooo.tech>

_pkgname='wsrx'
pkgname="wsrx-git"
pkgver=0.4.9.r0.g91fbc3a
pkgrel=1
pkgdesc="Controlled TCP-over-WebSocket forwarding tunnel."
arch=('x86_64')
url='https://github.com/XDSEC/WebSocketReflectorX'
license=('MIT')
makedepends=('git' 'rust' 'bash' 'sed')
depends=("gcc-libs" "pcre2" "graphite" "glib2" "brotli" "harfbuzz" "libpng" "bzip2" "zlib" "expat" "glibc" "freetype2" "fontconfig")
provides=("${_pkgname}")
source=("git+https://github.com/XDSEC/WebSocketReflectorX.git")
sha256sums=('SKIP')
options=(!lto)

pkgver() {
    cd "${srcdir}/WebSocketReflectorX"
    git describe --long --tags | sed 's|^upstream/||;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/WebSocketReflectorX"
  cargo build --release --bins
}

package() {
  cd "${srcdir}/WebSocketReflectorX"
  install -D ./target/release/${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
  install -D ./target/release/${_pkgname}-desktop "${pkgdir}/usr/bin/${_pkgname}-desktop"
  install -Dm644 "./freedesktop/${_pkgname}-desktop.desktop" "$pkgdir"/usr/share/applications/${_pkgname}-desktop.desktop
  install -Dm644 "./freedesktop/${_pkgname}-desktop.svg" "$pkgdir"/usr/share/icons/hicolor/scalable/apps/${_pkgname}-desktop.svg
}
