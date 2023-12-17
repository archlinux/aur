pkgname=nsproxy
pkgver=0.2.0
pkgrel=1
pkgdesc='A command-line tool that force applications to use a specific SOCKS5 or HTTP proxy.'
arch=('any')
url='https://github.com/nlzy/nsproxy'
license=('GPL2')
depends=('cmake')
source=("$pkgname-$pkgver.zip"::"https://github.com/nlzy/$pkgname/archive/refs/tags/v$pkgver.zip")
sha512sums=('307c9ce3c65da1f472768cf76de72e6fe142399b8fe013c5a4346460071a0f63cf9059c64431119bbf63d9fc6d7cd45639fd8f6047de9a8946ebde516c0145d3')



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

