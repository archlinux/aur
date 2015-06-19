# Maintainer: Félix Saparelli <aur@passcod.name>
# Contributor: KokaKiwi <kokakiwi@kokakiwi.net>
# CAUTION: Will not even build if an existing rust is in PATH

pkgname=multirust
pkgver=0.0.6
pkgrel=4
pkgdesc="A tool for managing multiple Rust installations"
arch=('any')
url="https://github.com/brson/multirust"
license=('MIT')
source=("https://github.com/brson/multirust/archive/${pkgver}.tar.gz")
sha512sums=('790784182e4a9d4e600cbdb29a71578f1772e2e40f886a6858db84761edc596ff7387eb3048180c1f69f34d5f8aaf13353189508c8558348e43cb260e9d89e0c')
depends=('bash' 'curl')
builddepends=('git')
optdepends=('gnupg: to verify signatures')
conflict=('rust' 'rust-nightly' 'rust-nightly-bin' 'rust-beta-bin' 'rust-git')
provides=('rust' 'cargo')

prepare() {
  cd "${srcdir}/multirust"
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
