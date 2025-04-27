# Maintainer: Andrej Radović <r.andrej@gmail.com>

pkgname=ptags
pkgver=0.3.5
pkgrel=1
pkgdesc='A parallel universal-ctags wrapper for git repository.'
arch=('i686' 'x86_64')
url='https://github.com/dalance/ptags'
license=('MIT')
makedepends=('git' 'cargo')
depends=('git' 'ctags')
optdepends=('git-lfs: git-lfs indexing')
provides=('ptags')
conflicts=('ptags-git')
source=("$pkgname"::'git+https://github.com/dalance/ptags.git')
source=(
    $pkgname-$pkgver.zip::https://github.com/dalance/ptags/archive/v$pkgver.zip
)
sha256sums=('724ededc33fd3f39ef81325668089bd64cf5c0721f52768ced98eb6a14805bf2')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    cargo build --release
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -D 'target/release/ptags' "$pkgdir/usr/bin/ptags"
    install -D 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
