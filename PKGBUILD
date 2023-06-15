pkgname=nsproxy
pkgver=0.1.2
pkgrel=1
pkgdesc='A command-line tool that force applications to use a specific SOCKS5 or HTTP proxy.'
arch=('any')
url='https://github.com/nlzy/nsproxy'
license=('GPL2')
depends=('cmake')
source=("$pkgname-$pkgver.zip"::"https://github.com/nlzy/$pkgname/archive/refs/tags/v$pkgver.zip")
            
sha512sums=('65d205ce5ef81ecffc7e6f939bc9281bf100bb4493241f146471427a3f3108079902cc3ae1e26a0a19d8bd8f8158d41363abdfb6b8a475677e7c02ade92e1c5c')



build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}

