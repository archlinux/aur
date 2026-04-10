pkgname=paga-git
_pkgname=paga
pkgver=0.1.0.r1.g1234567
pkgrel=1
pkgdesc='Terminal pager, alternative to more/less (GIT version)'
arch=('x86_64')
url='https://github.com/StudiCraft/paga'
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=paga.install
source=("$_pkgname::git+https://github.com/StudiCraft/paga.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

build() {
    cd "$_pkgname"
    export CARGO_HOME="$srcdir/cargo-home"
    cargo build --release --locked
}

package() {
    cd "$_pkgname"
    install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
