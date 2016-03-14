# Maintainer: Vlad M. <vlad@archlinux.net>
# Maintainer: Félix Saparelli <aur@passcod.name>
# Contributor: KokaKiwi <kokakiwi@kokakiwi.net>

pkgname=multirust
pkgver=0.8.0
pkgrel=2
pkgdesc="A tool for managing multiple Rust installations"
arch=('any')
url="https://github.com/brson/multirust"
license=('Apache' 'MIT')
source=('git+https://github.com/brson/multirust')
md5sums=('SKIP')
depends=('bash' 'curl')
builddepends=('git')
optdepends=('gnupg: to verify signatures')
conflicts=('rust' 'rust-nightly' 'rust-nightly-bin' 'rust-git' 'cargo' 'cargo-bin')
provides=('rust' 'cargo')

prepare() {
  cd "$pkgname"
  git checkout $pkgver
  git submodule update --init
  curl -O https://github.com/rust-lang/rust/blob/master/LICENSE-MIT
  curl -O https://github.com/rust-lang/rust/blob/master/LICENSE-APACHE
}

build() {
  cd "$pkgname"

  ./build.sh
}

package() {
  cd "$pkgname"

  ./install.sh --prefix="$pkgdir/usr/"
  install -m644 -D -t "$pkgdir/usr/share/licenses/multirust/" LICENSE-MIT LICENSE-APACHE
}
