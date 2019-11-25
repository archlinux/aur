# Maintainer: Andrej Radović <r.andrej@gmail.com>

pkgname=ptags
pkgver=0.3.1
pkgrel=1
pkgdesc='A parallel universal-ctags wrapper for git repository.'
arch=('i686' 'x86_64')
url='https://github.com/dalance/ptags'
license=('MIT')
makedepends=('git' 'cargo')
depends=('git' 'ctags' 'git-lfs')
provides=('ptags')
conflicts=('ptags-git')
source=("$pkgname"::'git+https://github.com/dalance/ptags.git')
source=(
    $pkgname-$pkgver.zip::https://github.com/dalance/ptags/archive/v$pkgver.zip
)
sha256sums=('ee1667edff9282d8ae8b6d7087b8a6fa2ed46c93ee2b15054d7a37a703f9a988')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    cargo build --release
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -D 'target/release/ptags' "$pkgdir/usr/bin/ptags"
    install -D 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
