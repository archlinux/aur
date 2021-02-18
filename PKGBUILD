# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=bottom-cli-git
pkgver=1.1.1.r18.710a610
pkgrel=1
pkgdesc='Fantastic (maybe) CLI for translating between bottom and human-readable text'
url='https://github.com/bottom-software-foundation/bottom-rs'
arch=('x86_64' 'i686')
license=('MIT')
provides=('bottomify')
depends=('gcc-libs')
makedepends=('git' 'cargo')
source=("${pkgname}::git+https://github.com/bottom-software-foundation/bottom-rs.git")
sha256sums=('SKIP')
b2sums=('SKIP')

pkgver() {
  cd "${pkgname}"

  local cargo_version=$(grep "^version" < Cargo.toml | head -n 1 | awk '{ print $3 }' | sed 's/\"//g')

  printf "%s.r%s.%s" "${cargo_version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"

  cargo build --release --all-features --target-dir=target
}

package() {
  cd "${pkgname}"

  install -Dm0755 -t "${pkgdir}/usr/bin" target/release/bottomify
}
