# Maintainer: xiliuya <xiliuya@aliyun.com>
_pkgname=tdlib-tg
pkgname=$_pkgname-git
pkgver=v1.8.0.r4336.g404761c52
pkgrel=1
pkgdesc="Cross-platform library for building Telegram clients "
arch=('any')
url="https://core.telegram.org/tdlib"
license=('BSL-1.0')
provides=('tdlib-tg')
depends=('gcc' 'zlib' 'openssl')
makedepends=('gperf' 'cmake')
source=("$_pkgname::git+https://github.com/tdlib/td.git")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    git_version=$( git describe --long --tags 2>/dev/null )
    IFS='-' read last_tag tag_rev commit <<< "$git_version"
    printf '%s.r%s.%s' "$last_tag" "$tag_rev" "$commit"
}

build() {
    cd $_pkgname

    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    cmake --build .
}
package() {
    cd $_pkgname
    mkdir -p $pkgdir/opt/$_pkgname
    # install to pkg dir
    cmake --install ./build --prefix "$pkgdir/opt/$_pkgname"
}
