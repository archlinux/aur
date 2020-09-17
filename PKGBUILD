# Maintainer: Andrea Scarpino <andrea at archlinux dot org>
# Maintainer: Benjamin Bädorf <aur at benjaminbaedorf dot eu>

pkgname=base16-builder-rust-git
_pkgname=base16-builder-rust
pkgver=0.1.1.34.g34fec12
pkgrel=1
pkgdesc="A Rust implementation of a base16 builder"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/ilpianista/base16-builder-rust"
license=('MIT')
makedepends=('git' 'openssl' 'zlib' 'rust' 'cargo')
provides=()
conflicts=()
source=("$_pkgname::git+https://github.com/ilpianista/base16-builder-rust.git")
md5sums=('SKIP')

pkgver() {
#  cd ${srcdir}/${_pkgname}
  cd "$srcdir/$_pkgname"
  #git rev-list --count HEAD
  echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"

}

package() {
    cd $srcdir
    cargo install --no-track --root="$pkgdir/usr" --git=https://github.com/ilpianista/base16-builder-rust
}
