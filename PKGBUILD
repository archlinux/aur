# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=iamb-git
_pkg=iamb
pkgver=0.1.e98d58a
pkgrel=2
pkgdesc='A Matrix client for Vim addicts'
url='https://github.com/ulyssa/iamb'
arch=('x86_64')
license=('Apache')
makedepends=('git' 'rust' 'cargo')
conflicts=('iamb')
provides=('iamb')
source=("git+$url.git")
sha512sums=('SKIP')
options=('!lto')

build() {
  cd $_pkg
  cargo build --release
}

package() {
  install -Dm644 "$srcdir/$_pkg/LICENSE" "$pkgdir/usr/share/licenses/$_pkg/LICENSE"
  install -Dm755 "$srcdir/$_pkg/target/release/iamb" "$pkgdir/opt/$_pkg/iamb"
  install -Dm755 "$srcdir/$_pkg/README.md" "$pkgdir/opt/$_pkg/README.md"

  # link to /usr/bin
  install -d "$pkgdir/usr/bin"
  ln -s /opt/$_pkg/iamb "$pkgdir/usr/bin"
}
