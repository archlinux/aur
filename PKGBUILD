# Maintainer: Vasia Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")

pkgname=rua
pkgver=0.5.5
pkgrel=5
pkgdesc='convenient jailed AUR helper in rust'
url='https://github.com/vn971/rua'
source=("git+https://github.com/vn971/rua.git#tag=$pkgver")
arch=('x86_64' 'i686')
license=('GPL3')
makedepends=('cargo')
depends=('bubblewrap' 'git')

# gpg --keyserver keys.gnupg.net --recv-keys AEA6FBA1A5CC9777229EADAB63227A540AC1F12B
validpgpkeys=('AEA6FBA1A5CC9777229EADAB63227A540AC1F12B')
sha512sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  git verify-commit HEAD
}

build () {
  cd "$srcdir/$pkgname"
  cargo build --release
}

package() {
  install -Dm755 "${srcdir}/$pkgname/target/release/rua" "${pkgdir}/usr/bin/rua"
}