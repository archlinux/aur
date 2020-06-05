# Maintainer: wallace < str(11) + my_id at gmail dot com>
# Maintainer: Iain Earl <iain at itmecho dot com>

pkgname='navi'
pkgdesc='An interactive cheatsheet tool for the command-line'
pkgver='2.7.0'
pkgrel='1'
arch=('x86_64')
url='https://github.com/denisidoro/navi'
license=('Apache 2.0')
depends=()
optdepends=('fzf' 'skim')
makedepends=('rust' 'gcc')
checkdepends=('rust' 'git')
provides=('navi')
source=("$pkgname-$pkgver.tar.gz::https://github.com/denisidoro/navi/archive/v${pkgver}.tar.gz")
sha256sums=('47a6aa786702eb5387e9bc77790749d77240835293982cffc9ba3a329a359c13')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/navi" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
