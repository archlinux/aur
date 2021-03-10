pkgname=coreutils-rust
pkgver=0.0.4
pkgrel=1
pkgdesc="Rust reimplementation of coreutils"
url="https://github.com/uutils/coreutils/"
license=('MIT')
arch=('x86_64')
depends=()
makedepends=('cargo') # 'python-sphinx')
conflicts=("coreutils")
replaces=("coreutils")
provides=("coreutils")
source=("$pkgname-$pkgver.tar.gz::https://github.com/uutils/coreutils/archive/$pkgver.tar.gz")
sha512sums=('5d5719a0362a20c3a5ee85683c436a1bfcf5b8bf922ebe60c58f620b93d3bdf67c658a987cb8281b160442bd98cb7b4b00bacd9e3814d1b0ae3b6dd1cd43ec83')

package() {
    cd coreutils-$pkgver
    cargo install --no-track --locked --all-features --root "$pkgdir/usr/" --path .
    # clear name for multicall executable
    mv "$pkgdir/usr/bin/coreutils" "$pkgdir/usr/bin/coreutils-rust"
    # provide symlinks
    for name in $("$pkgdir/usr/bin/coreutils-rust" |grep ','|sed "s/\n//g"|sed 's/,//g')
    do
        ln -s /usr/bin/coreutils-rust "$pkgdir/usr/bin/$name"
    done

}
