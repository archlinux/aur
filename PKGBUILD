# Maintainer: Fabian Thomys <git@fthomys.me>
pkgname=update-alternatives-git
pkgver=r0.g0
pkgrel=1
pkgdesc="A simple update-alternatives replacement written in Rust"
arch=('x86_64')
url="https://github.com/fthomys/update-alternatives"
options=('!debug')
license=('BSD')
depends=('gcc-libs' 'glibc' 'zenity')
makedepends=('git' 'rust' 'cargo')
provides=("update-alternatives-git=${pkgver}" "update-alternatives")
conflicts=('update-alternatives')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/update-alternatives"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/update-alternatives"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/update-alternatives"
  install -Dm755 "target/release/update-alternatives" "${pkgdir}/usr/bin/update-alternatives"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "man/update-alternatives.1" "$pkgdir/usr/share/man/man1/update-alternatives.1"
  install -Dm755 "data/update-alternatives.desktop" "$pkgdir/usr/share/applications/update-alternatives.desktop"
}

