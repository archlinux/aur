# Maintainer: Maxime “pep” Buquet <archlinux@bouah.net>

_pkgname=aparte
pkgname=${_pkgname}-git
pkgver=v0.1.0.r139.gd0315ea
pkgrel=1
pkgdesc="Simple XMPP console client written in Rust and inspired by Profanity."
url="https://github.com/paulfariello/aparte"
makedepends=('cargo')
provides=('aparte')
conflicts=('aparte')
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
license=('MPL2')
source=('aparte::git+https://github.com/paulfariello/aparte#branch=develop')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  cargo fetch
}

build() {
  cd "$srcdir/$_pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 target/release/aparte "$pkgdir/usr/bin/apart"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
