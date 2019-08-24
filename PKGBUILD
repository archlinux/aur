# Maintainer: Alexander Kjäll <alexander.kjall@gmail.com>
pkgname=ripasso-git
pkgrelname=ripasso
pkgver=149
pkgrel=1
pkgdesc="A password manager that uses the file format of the standard unix password manager 'pass', implemented in rust."
url="https://github.com/cortex/ripasso/"
arch=('x86_64')
license=("GPL3")
depends=()
makedepends=('openssl' 'libgit2' 'gettext' 'cargo')
source=("git://github.com/cortex/ripasso.git")
conflicts=('ripasso')
md5sums=('SKIP')

build() {
    cd "$pkgrelname" || exit 1
    cargo build -p ripasso-cursive --release
}

pkgver() {
  cd ${srcdir}/${pkgrelname} || exit 1
  git rev-list --count HEAD
}

package() {
    cd "$pkgrelname" || exit 1
    install -Dm4555 "$srcdir/$pkgrelname/target/release/ripasso-cursive" "$pkgdir/usr/bin/$pkgrelname-cursive"
}
