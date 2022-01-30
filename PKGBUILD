# Maintainer: Arne Beer <arne@twobeer.de>

pkgname=bombadil-git
pkgver=2.2.3.r4.gbac3b31
pkgrel=1
arch=('any')
pkgdesc='A dotfile manager with templating'
license=('MIT')
options=('!lto')
makedepends=('git' 'cargo')
provides=('bombadil')
url='https://github.com/oknozor/toml-bombadil'
source=("$pkgname"::"git://github.com/oknozor/toml-bombadil.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd $pkgname

    # Build the daemon and client
    cargo build --release --locked
}

package() {
    cd $pkgname

    # Install binaries
    install -Dm755 "target/release/bombadil" "${pkgdir}/usr/bin/bombadil"

    # Install License
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/bombadil/LICENSE"
}
