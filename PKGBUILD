# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=just-git
pkgver=latest
pkgrel=1
pkgdesc="Just a command runner, like make."
arch=("x86_64" "i686")
url="https://github.com/casey/${pkgname%-git}"
license=("custom:WTFPL" "custom:MIT" "APACHE")
depends=("gcc-libs")
makedepends=("cargo")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/casey/${pkgname%-git}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g' | tr -d v
}

build() {
  cd "${pkgname%-git}"
  cargo build --release
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 "${srcdir}/${pkgname%-git}/target/release/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
  install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
