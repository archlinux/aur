# Maintainer: Cooper Paul EdenDay <cedenday at protonmail dot com>

pkgname=rvi-git
_pkgname=rvi
pkgver=0.1.0
pkgrel=1
pkgdesc="A 'vi' like editor for rust, written in rust."
url="https://github.com/cedenday/rvi"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
makedepends=('cargo')
provides=('rvi')
source=('git+https://github.com/cedenday/rvi.git')
sha256sums=('SKIP')

build() {
  cd "$_pkgname"
  cargo build --release
  target/release/$_pkgname --completions bash > $_pkgname.bash-completion
}

check() {
  cd "$_pkgname"
  cargo test --release
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_pkgname.bash-completion" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
