# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=marks-git
pkgver=VERSION
pkgrel=1
pkgdesc='A simple and fast search-engine like tool for org/markdown files.'
arch=('x86_64')
url='https://github.com/isamert/marks'
license=('GPL3')
provides=('marks')
makedepends=('cargo'
             'git')
conflicts=()

source=("git+https://github.com/isamert/marks.git")

md5sums=('SKIP')

pkgver() {
  cd ${pkgname/\-git/}
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd ${pkgname/\-git/}
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd ${pkgname/\-git/}
  install -Dm 755 target/release/${pkgname/\-git/} -t "${pkgdir}/usr/bin"
}
