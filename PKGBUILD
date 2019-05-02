# Maintainer: Rodrigo Leite <rodrigolf.dev@gmail.com>
_pkgname=funkwhale-cli
pkgname=${_pkgname}-git
pkgver=v0.5.0+5+g2802466
pkgrel=1
pkgdesc='CLI tool for interacting with funkwhale instances'
arch=('x86_64')
url="https://github.com/RodrigoLeiteF/funkwhale-cli"
license=('GPLv2')
depends=('openssl')
makedepends=('rust' 'cargo' 'git')
provides=('funkwhale-cli')
conflicts=('funkwhale-cli')
source=("git+https://github.com/RodrigoLeiteF/funkwhale-cli")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --tags | sed 's/-/+/g'
}

package() {
    cd funkwhale-cli
    cargo build --release
    mkdir -p $pkgdir/usr/bin
    mv target/release/funkwhale-cli $pkgdir/usr/bin
}
