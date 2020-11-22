# Maintainer: Gianluca Recchia <gianluca dot recchia97 at libero dot it>

pkgname=rusty-tags-git
_pkgname="${pkgname%-git}"
pkgver=3.8.1.r0.gca08d2a
pkgrel=1
pkgdesc='Create ctags/etags for a cargo project and all of its dependencies'
url="https://github.com/dan-t/$_pkgname"
depends=('ctags')
makedepends=('cargo' 'git')
arch=('x86_64')
license=('BSD')
provides=('rusty-tags')
conflicts=('rusty-tags')
source=("${pkgname}::git+$url")
sha1sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  cargo build --release
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
