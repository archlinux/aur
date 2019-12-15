# Maintainer: caiye <ye dot jingchen at gmail dot com>
# Contributor: Dario Ostuni <dario.ostuni@gmail.com>

_pkgname=simple-http-server
pkgname=$_pkgname-git
pkgver=r145.3483193
pkgrel=1
pkgdesc="Simple http server in Rust"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/TheWaWaR/simple-http-server"
license=('MIT')
depends=('openssl-1.0')
makedepends=('cargo')
conflicts=('simple-http-server')
provides=('simple-http-server')
options=()
source=("git+https://github.com/TheWaWaR/$_pkgname.git"
        "simple-http-server@.service")
sha384sums=('SKIP'
            '70a1a58c192e9bdaa3f5c7a3457bc42ccf3b010134c827380f6db540f518eb9ecad27250ad47fb9a3cb22f5b0c3ef8ac')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    export OPENSSL_LIB_DIR="/usr/lib/openssl-1.0"
    export OPENSSL_INCLUDE_DIR="/usr/include/openssl-1.0"
    cd "$_pkgname"
    cargo build --release --target-dir target
}

package() {
    install -Dm755 "$_pkgname/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm755 ./simple-http-server@.service "$pkgdir/usr/lib/systemd/system/simple-http-server@.service"
}
