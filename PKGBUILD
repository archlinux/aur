# Maintainer: Haochen Tong <i at hexchain.org>

pkgname=cloudflare-warp
pkgver=2017.12.1
pkgrel=1
pkgdesc="Cloudflare Warp exposes applications running on your local web server, on any network with an Internet connection"
url="https://warp.cloudflare.com/"
license=("custom")
arch=('x86_64')
depends=("glibc")
source=("https://bin.equinox.io/c/2ovkwS9YHaP/warp-stable-linux-amd64.deb"
        LICENSE.cloudflare-warp)

prepare() {
    cd "$srcdir"
    bsdtar -xvf data.tar.gz
    bsdtar -xvf control.tar.gz
}

pkgver() {
    cd "$srcdir"
    grep "^Version:" control | cut -d' ' -f2
}

package() {
    cd "$srcdir"
    install -Dm755 usr/local/bin/cloudflare-warp -t "$pkgdir/usr/bin/"
    install -Dm755 usr/share/doc/warp/changelog.gz -t "$pkgdir/usr/share/doc/cloudflare-warp/"
    install -Dm644 LICENSE.cloudflare-warp "$pkgdir/usr/share/licenses/cloudflare-warp/LICENSE"
}

sha256sums=('c798847145d1d1e09e9b90bb5cdad2ca5b8e1b8a5ac3fd28eb9e2fe60a21a95f'
            '80d6959f6ba9fc2f199853c81f2868f24c91d9b112ff1b51318a158c090d780d')
