# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=pipe-rename-git
pkgver=1.1.6.r1.gb734616
pkgrel=1
pkgdesc='Rename your files using your favorite text editor'
url='https://github.com/marcusbuffett/pipe-rename'
arch=('x86_64' 'i686')
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo')
source=("${pkgname}::git+https://github.com/marcusbuffett/pipe-rename.git")
sha256sums=('SKIP')
b2sums=('SKIP')

pkgver() {
  cd "${pkgname}"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"

  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "${pkgname}"

  install -Dm0755 target/release/renamer "${pkgdir}/usr/bin/pipe-rename"
}
