# Maintainer: Marcel Unbehaun <f.rostze.ux at gmail dot com>
pkgname=appinfo-vdf-git
pkgver=0.r1.8251f7e
pkgrel=1
pkgdesc="A command-line utility to parse Steam appinfo.vdf files"
arch=('x86_64')
url="https://github.com/pdfrod/appinfo-vdf"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pdfrod/appinfo-vdf.git')
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
	printf "%s.r%s.%s" "0" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"

  cargo build --release --locked
}

package() {
  cd "${pkgname%-git}"

  install -Dm755 "target/release/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"
}
