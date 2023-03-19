pkgname=nsproxy
pkgver=0.1.1
pkgrel=1
pkgdesc='A command-line tool that force applications to use a specific SOCKS5 or HTTP proxy.'
arch=('any')
url='https://github.com/nlzy/nsproxy'
license=('GPL2')
depends=('cmake')
source=("$pkgname-$pkgver.zip"::"https://github.com/nlzy/$pkgname/archive/refs/tags/v$pkgver.zip")
            
sha512sums=('a4b7679deda3dd735d496ba625fb5ad93ef4a542117ba6699be2af50ea3a30877688077cf13184ef73718eec5345ccf6cce65f26076e6a9a22fa11a093bee61f')



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

