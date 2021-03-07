# Maintainer: Arne Beer <arne@twobeer.de>

pkgname=pipes-rs-git
pkgver=v1.3.0.r7.gde5258d
pkgrel=1
arch=('any')
pkgdesc='An over-engineered rewrite of pipes.sh in Rust'
license=('MIT' 'APACHE')
makedepends=('git' 'cargo')
conflicts=()
provides=('pipes-rs')
url='https://github.com/CookieCoder15/pipes-rs'
source=("$pkgname"::"git://github.com/CookieCoder15/pipes-rs.git")
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

    # Install License
    install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/pipes-rs/LICENSE"
}
