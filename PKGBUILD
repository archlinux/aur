# Maintainer: d1t2 <dieterplex@gmail.com>
pkgname=cnx-git
pkgver=0.3.0.r276.g0f0406d
pkgrel=2
pkgdesc='cnx - A simple X11 status bar for use with simple WMs in Rust'
arch=('x86_64')
url='https://github.com/mjkillough/cnx'
license=('MIT')
makedepends=('cargo' 'git')
depends=('libxcb' 'xcb-util' 'xcb-util-wm' 'xcb-util-keysyms' 'pango' 'cairo')
optdepends=('alsa-lib' 'alsa-utils' 'wireless_tools' 'lm_sensors')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+$url")
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  echo $(grep '^version =' cnx/Cargo.toml|head -n1|cut -d\" -f2).r$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
  cd "${pkgname%-*}"
  cargo build --release 
}

package() {
  cd "${pkgname%-*}"
  install -Dm755 target/release/cnx-bin -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE                -t "$pkgdir/usr/share/licenses/${pkgname%-*}"
  install -Dm644 README.md              -t "$pkgdir/usr/share/doc/${pkgname%-*}"
}
