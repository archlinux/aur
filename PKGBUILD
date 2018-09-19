pkgname=capnproto-java
pkgver=0.1.3
pkgrel=1
pkgdesc="Cap'n Proto for Java"
arch=('i686' 'x86_64')
url="https://github.com/capnproto/capnproto-java"
license=('MIT')
depends=('capnproto')
source=("https://github.com/capnproto/capnproto-java/archive/v0.1.3.tar.gz"
        "fix-gcc-c++14-version.patch")
sha256sums=('feb0cef6f4a64c9228ddc206c8a7322b8a069323b5a3c4ad496eb03fb14c0bbc'
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

