# Maintainer: Lyra saturn@saturncorgi.com
pkgname=protec
pkgver=0.2.4
pkgrel=1
pkgdesc="Yell at anyone who dares touch your computer when you're not there"
arch=(x86_64)
depends=('cargo' 'libinput' 'evtest' 'alsa-lib')
license=(custom:for_good_eyes_only)
conflicts=(protec-git)
source=(
${pkgname}-${pkgver}.tar.gz::https://github.com/Saturncorgi/protec/archive/refs/tags/$pkgver.tar.gz
)
sha256sums=('6471f34a38fd53fc25d61d64ce6ddbf09f4921b7f7f15619cfb43cd79680d54a')
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
