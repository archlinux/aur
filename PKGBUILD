# Maintainer: Tryton Van Meer <trytonvanmeer at protonmail dot com>

pkgname='hiritsu'
_reponame='Hiritsu'
pkgdesc='CLI tool for getting aspect ratio of files.'
pkgver='1.0.0'
pkgrel='1'
arch=('x86_64')
url='https://github.com/tryton-vanmeer/Hiritsu'
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust' 'gcc')
checkdepends=('rust' 'git')
provides=(hiritsu)
source=("$pkgname-$pkgver.tar.gz::https://github.com/tryton-vanmeer/Hiritsu/archive/v${pkgver}.tar.gz")
sha256sums=('786308efb66d1dc885aa9e7979fd51b955c16c1ae9956bd69a29095fc53ea6a9')

build() {
    cd "$_reponame-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$_reponame-$pkgver"
    cargo test --locked
}

package() {
    cd "$_reponame-$pkgver"
    install -Dm755 "target/release/hiritsu" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
