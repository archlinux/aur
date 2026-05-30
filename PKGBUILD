# Maintainer: mfw <mfwolffe@outlook.com>

pkgname=mat-cat
pkgver=0.4.0
pkgrel=1
pkgdesc='A fast cat/bat alternative with syntax highlighting, a built-in pager, and zero-copy I/O'
arch=('x86_64' 'aarch64')
url='https://github.com/tenseleyFlow/mat'
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=('mat')
conflicts=('mat')
source=("mat-$pkgver::git+https://github.com/tenseleyFlow/mat.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
    cd "mat-$pkgver"
    git submodule update --init --recursive
}

build() {
    cd "mat-$pkgver"
    ./configure
    make
}

check() {
    cd "mat-$pkgver"
    make test
}

package() {
    cd "mat-$pkgver"

    install -Dm755 mat "$pkgdir/usr/bin/mat"
    install -Dm644 man/mat.1 "$pkgdir/usr/share/man/man1/mat.1"
    install -Dm644 completions/mat.bash "$pkgdir/usr/share/bash-completion/completions/mat"
    install -Dm644 completions/mat.zsh "$pkgdir/usr/share/zsh/site-functions/_mat"
    install -Dm644 completions/mat.fish "$pkgdir/usr/share/fish/vendor_completions.d/mat.fish"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
