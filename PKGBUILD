# Maintainer: Lyra saturn@saturncorgi.com
pkgname=protec
pkgver=0.2.2
pkgrel=1
pkgdesc="Yell at anyone who dares touch your computer when you're not there"
arch=(x86_64)
depends=('cargo' 'libinput' 'evtest' 'alsa-lib')
license=(custom:for_good_eyes_only)
conflicts=(protec-git)
source=(
${pkgname}-${pkgver}.tar.gz::https://github.com/Saturncorgi/protec/archive/refs/tags/$pkgver.tar.gz
)
sha256sums=('1086ffd5342c39f792304af4f8555aa4d24ee7e9b7031ab62a1feeb7a9f62dfa')
url="https://github.com/Saturncorgi/protec"
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
