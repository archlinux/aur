pkgname=capnproto-java
pkgver=0.1.4
pkgrel=1
pkgdesc="Cap'n Proto for Java"
arch=('i686' 'x86_64')
url="https://github.com/capnproto/capnproto-java"
license=('MIT')
depends=('capnproto')
source=("https://github.com/capnproto/capnproto-java/archive/v${pkgver}.tar.gz"
        "fix-gcc-c++14-version.patch")
sha256sums=('fc9f9d047234081be50586a47f300f05c62840ce0d15049aa9adc5ab5bd277e7'
            'f29dbc46ed874ef8f8dd15c0a50567ce65e3c05e5e09749339218d740049a255')

build() {
    cd "$pkgname-$pkgver"
    patch -p 1 < ../fix-gcc-c++14-version.patch
    make
}

package() {
    cd "$pkgname-$pkgver"
    
    install -D capnpc-java "$pkgdir"/usr/bin/capnpc-java
    install -Dm644 compiler/src/main/schema/capnp/java.capnp "$pkgdir"/usr/include/capnp/java.capnp
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

