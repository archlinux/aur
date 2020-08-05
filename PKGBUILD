# Maintainer: Babets <fbabetz+aur [.at.] yahoo (.dot.) it>
pkgname=me-tv-git
_pkgname=me-tv
pkgver=v3.1.0.0.gb278bbb
pkgrel=1
pkgdesc="DVB viewer based on GTK+3 and GStreamer"
arch=('x86_64')
url="https://github.com/Me-TV/Me-TV"
license=('GPL3')
depends=('gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav' 'gst-plugin-gtk')
makedepends=('rust' 'meson' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "me-tv-bzr")
install="${_pkgname}.install"
source=("${pkgname}::git+https://github.com/Me-TV/Me-TV.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | tr - .
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir Build
  cd Build
  meson --prefix /usr ..
# cargo build --release --locked --all-features
  ninja
}

check() {
  cd "${srcdir}/${pkgname}"
  cargo test --release --locked
# ninja -C build check
}

package() {
  cd "${srcdir}/${pkgname}"
# install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
# install -Dm 755 target/release/${pkgname}-record -t "${pkgdir}/usr/bin"
# install -Dm 755 target/release/${pkgname}-schedule -t "${pkgdir}/usr/bin"
  DESTDIR="$pkgdir" ninja -C Build install
}

