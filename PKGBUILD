# Maintainer: Lyra saturn@saturncorgi.com
pkgname=protec
pkgver=0.2.1
pkgrel=1
pkgdesc="Yell at anyone who dares touch your computer when you're not there"
arch=(x86_64)
depends=('cargo' 'libinput' 'evtest' 'alsa-lib')
license=(custom:for_good_eyes_only)
conflicts=(protec-git)
source=(
${pkgname}-${pkgver}.tar.gz::https://github.com/Saturncorgi/protec/archive/refs/tags/$pkgver.tar.gz
)
sha256sums=('1665bee06b7affd0843f3ba3b93ae5a2c50ebd6f14731c26c3de8cd1d0795326')
prepare() {
    tar -xf $pkgver.tar.gz
    cd protec*
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}
build(){
    cd protec*
    cargo build --release --offline
}
package(){
    cd protec*
    install -Dm711 -t "$pkgdir"/usr/bin target/release/protec
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$protec $srcdir/protec-$pkgver/LICENSE.md
}
