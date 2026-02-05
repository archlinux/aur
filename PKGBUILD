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
sha256sums=('474343a9af88d2128d5b0b7c77f960ad9bf59997f55f08a855212f098b09b230')
prepare() {
    cd protec-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}
build(){
    cd protec-$pkgver
    cargo build --release --offline
}
package(){
    cd protec-$pkgver
    install -Dm711 -t "$pkgdir"/usr/bin target/release/protec
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$protec $srcdir/protec-$pkgver/LICENSE.md
}
