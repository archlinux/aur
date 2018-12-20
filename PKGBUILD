# Maintainer: Andrej Radović <r.andrej@gmail.com>

pkgname=ptags
pkgver=0.2.1
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
sha256sums=('86ef6f22b8e943f6c2cb09362211f4f2f5d39b9398df4123f7eb13cbc581457d')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    cargo build --release
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -D 'target/release/ptags' "$pkgdir/usr/bin/ptags"
    install -D 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
