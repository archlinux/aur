# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: timvisee <3a4fb3964f@sinenomine.email>
# https://github.com/orhun/pkgbuilds

pkgname=prs-git
pkgver=0.2.8.r1.ge038d45
pkgrel=1
pkgdesc="Secure, fast & convenient password manager CLI using GPG and git to sync (git)"
arch=('any')
url="https://gitlab.com/timvisee/prs"
license=('GPL3')
depends=('gpgme' 'dbus' 'libxcb')
makedepends=('rust' 'python' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  cargo build --package prs-cli --release --locked
}

check() {
  cd "${pkgname%-git}"
  cargo test --package prs-cli --release --locked
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
