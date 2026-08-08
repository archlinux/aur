# Maintainer: crux <c-rrux@outlook.com>

pkgname=kursor
pkgver=4.3.15
pkgrel=1
pkgdesc="Keyboard-driven mouse-cursor -- service (grid & glide-*) & cli (pos / click / move / moveto)"
arch=(x86_64)

_github_url=https://github.com/rruxx/$pkgname
_gitee_url=https://gitee.com/rrux/$pkgname
url="${_github_url} ${_gitee_url}"

license=('AGPL-3.0-or-later')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname-bin")
install="$pkgname.install"
depends=('glibc' 'libcap')
makedepends=('cargo')

source=("${_github_url}/archive/refs/tags/v$pkgver.tar.gz"  # github
        "${_gitee_url}/archive/refs/tags/v$pkgver.tar.gz")  # gitee
sha256sums=('038e78c61f0e965fadf3d286306c066da44b849e0422951c7a4b27073e7e3689'
            '038e78c61f0e965fadf3d286306c066da44b849e0422951c7a4b27073e7e3689')

build() {
    cd "$pkgname-$pkgver"

    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/$pkgname" \
        "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "contrib/systemd/${pkgname}d.service" \
        "$pkgdir/usr/lib/systemd/system/${pkgname}d.service"
}
