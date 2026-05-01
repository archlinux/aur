# Maintainer: csmantle <aur at csmantle dot top>

_pkgname=abbs-update-checksum
pkgname="$_pkgname"-git
pkgver=0.4.1.r0.g19b15f1
pkgrel=1
pkgdesc='A tool to update ABBS tree package checksums'
arch=('x86_64' 'aarch64' 'loong64')
url='https://github.com/AOSC-Dev/abbs-update-checksum'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git' 'rust')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/AOSC-Dev/abbs-update-checksum.git')
sha256sums=('SKIP')
options=('!lto')

pkgver() {
  cd "$srcdir"/"$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"/"$_pkgname"
  cargo build --release --locked
}

check() {
  cd "$srcdir"/"$_pkgname"
  cargo test --locked
}

package() {
  cd "$srcdir"/"$_pkgname"

  install -vDm755 target/release/"$_pkgname" "$pkgdir"/usr/bin/"$_pkgname"
  install -vDm644 README.md "$pkgdir"/usr/share/doc/"$_pkgname"/README.md
  install -vDm644 COPYING "$pkgdir"/usr/share/licenses/"$_pkgname"/COPYING
}
