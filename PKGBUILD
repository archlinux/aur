# Maintainer: Redson <redson@riseup.net>
pkgname=ppfetch-rs-git
_pkgname=ppfetch-rs
pkgver=2.0.0.r0.gbb6974c
pkgrel=1
pkgdesc="ppfetch, but written in Rust."
arch=('x86_64')
url="https://gitlab.com/redsonbr/ppfetch-rs"
license=('MIT')
provides=(${_pkgname}-bin)
conflicts=(${_pkgname}-bin)
makedepends=('rust' 'git')
depends=('wmctrl')
source=("$pkgname::git+https://gitlab.com/redsonbr/ppfetch-rs.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

build() {
  cd "${_pkgname}"
  cargo build --release
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm 755 target/release/${_pkgname} "$pkgdir/usr/bin/${_pkgname}"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
