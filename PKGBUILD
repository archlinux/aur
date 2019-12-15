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
install=simple-http-server-git.install
options=()
source=("git+https://github.com/TheWaWaR/$_pkgname.git"
        "simple-http-server@.service")
sha384sums=('SKIP'
            'a92987285f702de7eb5c34261e1c7d187b63c151db91fe6428c94428f24f771f0d38139d30febc4dfbfc76a8a697312f')

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
    install -Dm644 ./simple-http-server@.service "$pkgdir/usr/lib/systemd/system/simple-http-server@.service"
}
