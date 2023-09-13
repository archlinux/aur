# Maintainer: Arne Beer <arne@twobeer.de>

pkgname=pipes-rs-git
pkgver=v1.6.1.r9.gf139336
pkgrel=1
arch=('any')
pkgdesc='An over-engineered rewrite of pipes.sh in Rust'
license=('custom:Blue Oak Model')
makedepends=('git' 'rust')
conflicts=()
provides=('pipes-rs')
options=(!lto)
url='https://github.com/lhvy/pipes-rs'
source=("$pkgname"::"git+https://github.com/lhvy/pipes-rs.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd $pkgname
    cargo build --release --locked
}

package() {
    cd $pkgname

    # Install binaries
    install -Dm755 "target/release/pipes-rs" "${pkgdir}/usr/bin/pipes-rs"

    # Install license
    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/pipes-rs/LICENSE"
}
