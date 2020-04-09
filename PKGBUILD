# Maintainer: Rodrigo Leite <rodrigo@leite.dev>
_pkgname=klausies
pkgname=${_pkgname}-git
pkgver=v0.1
pkgrel=1
pkgdesc='Tool for submitting listens to various services (Last.FM, Listenbrainz, etc)'
arch=('x86_64')
url="https://github.com/RodrigoLeiteF/klausies"
license=('GPLv2')
makedepends=('rust' 'cargo' 'git')
provides=('klausies-git')
conflicts=('klausies-git')
source=("git+https://github.com/RodrigoLeiteF/klausies")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --tags | sed 's/-/+/g'
}

package() {
    cd klausies
    cargo build --release
    mkdir -p $pkgdir/usr/bin
    mv target/release/klausies $pkgdir/usr/bin

    mkdir -p $pkgdir/usr/lib/systemd/user
    mv klausies.service $pkgdir/usr/lib/systemd/user
}
