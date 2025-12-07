# Maintainer: mozi1924 <mozi1924@arasaka.ltd>
pkgname=natmap
pkgver=20250924
pkgrel=1
pkgdesc="TCP/UDP port mapping for full cone NAT"
arch=('any')
url="https://github.com/heiher/natmap"
license=('MIT')
depends=('glibc')
makedepends=('git' 'make' 'gcc')
provides=('natmap')
conflicts=('natmap')

# 核心修改：锁定 tag
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
md5sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"
    # 这里依然有效，因为 source 已经帮我们把仓库 clone 并 checkout 到 tag 了
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 bin/natmap "$pkgdir/usr/bin/natmap"
    # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 License "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
