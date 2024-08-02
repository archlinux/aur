# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=iamb-git
_pkg=iamb
pkgver=0.1.e98d58a
pkgrel=3
pkgdesc='A Matrix client for Vim addicts'
url='https://github.com/ulyssa/iamb'
arch=('x86_64')
license=('Apache')
makedepends=('git' 'rust' 'cargo')
conflicts=('iamb' 'iamb-bin')
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
  # Manpages
  install -Dm644 "$srcdir/$_pkg/docs/${_pkg}.1" "$pkgdir/usr/share/man/man1/${_pkg}.1"
  install -Dm644 "$srcdir/$_pkg/docs/${_pkg}.5" "$pkgdir/usr/share/man/man5/${_pkg}.5"
  # Config example
  install -Dm644 "$srcdir/$_pkg/config.example.toml" "$pkgdir/usr/share/doc/${_pkg}/config.example.toml"

  # link to /usr/bin
  install -d "$pkgdir/usr/bin"
  ln -s /opt/$_pkg/iamb "$pkgdir/usr/bin"
}
