# Maintainer: Firstname Lastname <email@example.org>

pkgname=terratactician-expandoria
_reponame=game
pkgver=0.4.2 # renovate: datasource=forgejo-releases registryUrl=https://codeberg.org depName=terratactician-expandoria/game
 pkgrel=1
pkgdesc='Open-source strategy puzzle video game, inspired by games like Dorfromantik.'
url='https://terratactician-expandoria.codeberg.page'
license=('AGPL-3.0-or-later')
makedepends=('cargo')
depends=('libx11' 'pkgconf' 'alsa-lib' 'libxcursor' 'libxrandr' 'libxi' 'vulkan-driver')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/terratactician-expandoria/game/archive/v0.4.2.tar.gz")
sha256sums=('31b623d008f562173de26232a5328110f6bb9bad0dc4ec2bdf09ba6b22f418fa')

prepare() {
    cd "${srcdir}/${_reponame}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {

    cd "${srcdir}/${_reponame}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${srcdir}/${_reponame}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "${srcdir}/${_reponame}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

