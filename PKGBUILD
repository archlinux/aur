# Maintainer: Dennis Hamester <dennis.hamester@startmail.com>

_pkgname=dotrix
pkgname=$_pkgname-git
pkgver=v0.1.0.r0.ga635623
pkgrel=1
pkgdesc="The pedantic dotfiles manager"
arch=(i686 x86_64)
url="https://gitlab.com/dennis.hamester/dotrix"
license=('custom:ISC')
makedepends=('rust' 'cargo')
source=("git+https://gitlab.com/dennis.hamester/dotrix.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_pkgname
    cargo build --release
}

package() {
    install -Dm755 "$srcdir"/$_pkgname/target/release/$_pkgname "$pkgdir"/usr/bin/$_pkgname
    install -Dm644 "$srcdir"/$_pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
