# Maintainer: m8D2 <omui (at) proton mail (dot) com>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: LIN Ruohshoei <lin dot ruohshoei plus archlinux at gmail dot com> 

pkgname=v2ray-plugin-git
pkgver=1.2.0.r0.gca36119
pkgrel=1
pkgdesc='A SIP003 plugin based on v2ray for shadowsocks (git version)'
arch=(x86_64)
url='https://github.com/shadowsocks/v2ray-plugin'
license=(MIT)
depends=(glibc)
makedepends=(go-pie git)
conflicts=(v2ray-plugin shadowsocks-v2ray-plugin)
source=("$pkgname::git+https://github.com/shadowsocks/v2ray-plugin.git")
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
    install -Dm755 v2ray-plugin "$pkgdir"/usr/bin/v2ray-plugin
}
