# Maintainer: reujab <reujab@gmail.com>
_pkgname=silver
pkgname=$_pkgname-git
pkgver=v1.1.0
pkgrel=3
makedepends=('rust' 'cargo' 'git')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A cross-shell customizable powerline-like prompt with icons"
license=('MIT')
source=(git+https://github.com/reujab/silver.git#branch=master)
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$_pkgname"
    cargo install --locked --all-features --no-track --root "$pkgdir/usr/" --path .
    install -Dm644 license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
