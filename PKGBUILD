# Maintainer: Andrej Radović <r.andrej@gmail.com>

pkgname=ptags
pkgver=0.3.2
pkgrel=3
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
sha256sums=('b78ed1c93822f0dd054c9a6bba25b224bbfd13acaa12dfd50bc71cb56fd2838c')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    cargo build --release
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -D 'target/release/ptags' "$pkgdir/usr/bin/ptags"
    install -D 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
