# Maintainer: Félix Saparelli <aur@passcod.name>
# Contributor: KokaKiwi <kokakiwi@kokakiwi.net>
# CAUTION: Will not even build if an existing rust is in PATH

pkgname=multirust
pkgver=0.7.0
pkgrel=1
pkgdesc="A tool for managing multiple Rust installations"
arch=('any')
url="https://github.com/brson/multirust"
license=('MIT')
source=('git+https://github.com/brson/multirust')
md5sums=('SKIP')
depends=('bash' 'curl')
builddepends=('git')
optdepends=('gnupg: to verify signatures')
conflict=('rust' 'rust-nightly' 'rust-nightly-bin' 'rust-beta-bin' 'rust-git')
provides=('rust' 'cargo')

prepare() {
  cd "$pkgname"
  git checkout $pkgver
  git submodule update --init
}

build() {
  cd "$pkgname"

  ./build.sh
}

package() {
  cd "$pkgname"

  ./install.sh --prefix="$pkgdir/usr/"
}
