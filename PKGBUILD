pkgname=xray-plugin-git
pkgver=1.5.0.r0.g4a86196
pkgrel=1
pkgdesc='A SIP003 plugin based on xray for shadowsocks (git version)'
arch=(x86_64)
url='https://github.com/teddysun/xray-plugin'
license=(MIT)
depends=(glibc)
makedepends=(go-pie git)
conflicts=(xray-plugin shadowsocks-xray-plugin)
source=("$pkgname::git+https://github.com/teddysun/xray-plugin.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"

    # cutting off 'v' prefix that presents in the git tag
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir"/$pkgname
    go build
}

package() {
    cd "$srcdir"/$pkgname
    install -Dm755 xray-plugin "$pkgdir"/usr/bin/xray-plugin
}
