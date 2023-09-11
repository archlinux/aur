# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=runwasi-git
pkgver=r515.1d1dc33
pkgrel=1
pkgdesc='Facilitates running Wasm / WASI workloads managed by containerd'
arch=('x86_64')
url="https://github.com/containerd/runwasi"
license=('APACHE')
depends=('gcc-libs' 'dbus' 'libseccomp')
makedepends=('pkgconf' 'make' 'cargo' 'clang' 'libelf')
source=("${pkgname}::git+https://github.com/containerd/runwasi.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$pkgname"
  make build TARGET=release
}

# TODO: split packages
package() {
  cd "$pkgname"
  make install TARGET=release PREFIX="${pkgdir}/usr"
}
