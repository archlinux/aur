# Maintainer: webstriix <webstriix@gmail.com>
pkgname=calculator-cli-git
_pkgname=calculator_cli
pkgver=0.1.0.r2.g59c3cba
pkgrel=1
pkgdesc="Simple Ratatui-based TUI calculator"
arch=('x86_64' 'aarch64')
url="https://github.com/webstriiix/${_pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('cargo' 'git')
provides=('calculator-cli')
conflicts=('calculator-cli')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  local count
  count="$(git rev-list --count HEAD)"
  printf "0.1.0.r%s.g%s" "${count}" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
