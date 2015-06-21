# Maintainer: Félix Saparelli <aur@passcod.name>
# Contributor: KokaKiwi <kokakiwi@kokakiwi.net>
# CAUTION: Will not even build if an existing rust is in PATH

pkgname=multirust
pkgver=0.0.6
pkgrel=5
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
  cd "${srcdir}/multirust"
  git checkout $pkgver
  git submodule update --init
}

build() {
  cd "${srcdir}/multirust"

  ./build.sh
}

package() {
  cd "${srcdir}/multirust"

  ./install.sh --destdir="${pkgdir}"
}
