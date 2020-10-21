# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=termimage-git
pkgver=1.1.0.r0.g07e16e591
pkgrel=1
pkgdesc="Display images in your terminal (git)"
arch=('x86_64')
url="https://github.com/nabijaczleweli/termimage"
license=('MIT')
makedepends=('cargo' 'git')
conflicts=("${pkgname%-git}" "${pkgname%-git}-bin")
provides=("${pkgname%-git}")
source=("git+${url}"
        "$url/releases/download/v${pkgver%.r*}/${pkgname%-git}-man-v${pkgver%.r*}.tbz2")
sha512sums=('SKIP'
            '7e2f220b7b023f357c1ee32ac7ed2936e4b01378d8fd2bf96becedb4dd16e8bae4a7eb57790292342beb9512e915e52d782782e04aec28d6d415f6741f241c5b')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  cargo build --release
}

check() {
  cd "${pkgname%-git}"
  cargo test --release
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "target/release/${pkgname%-git}" -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
  install -Dm 644 "../${pkgname%-git}-man-v${pkgver%.r*}/${pkgname%-git}.md" -t "$pkgdir/usr/share/doc/${pkgname%-git}"
  install -Dm 644 "../${pkgname%-git}-man-v${pkgver%.r*}/${pkgname%-git}.1" -t "$pkgdir/usr/share/man/man1"
}
