# Maintainer: Julien Savard <juju@juju2143.ca>
pkgname=aloevera-git
pkgver=0.2.0.r0.g6dcc324
pkgrel=1
pkgdesc="Graphical asset processing pipeline for the Commander X16"
arch=('x86_64')
url="https://github.com/yeastplume/aloevera"
license=('Apache')
depends=('gcc-libs')
makedepends=('cargo' 'git')
optdepends=('cc65: compile assembly and header files'
            'x16-emulator: run BASIC and bin files')
provides=('aloevera')
conflicts=('aloevera')
source=("git+https://github.com/yeastplume/aloevera.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cd "${pkgname%-git}"

  cargo build --release --locked --all-features
}

package() {
  cd "${pkgname%-git}"

  install -Dm755 "target/release/aloevera" "$pkgdir/usr/bin/aloevera"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"
  find docs -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/doc/${pkgname%-git}/{}" \;
  find samples -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/doc/${pkgname%-git}/{}" \;
}
