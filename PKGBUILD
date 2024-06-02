# Maintainer: Oliver Breitwieser <oliver@breitwieser.eu>

_pkgname=asfa
pkgname=${_pkgname}-bin
pkgver=0.10.0
pkgrel=4
pkgdesc='share files by upload via ssh and generation of a non-guessable link (pre-built)'
url="https://github.com/obreitwi/asfa"
license=("MIT")
arch=("x86_64")
provides=("asfa")
conflicts=("asfa")
depends=('gcc-libs' 'openssl' 'zlib')
_archive_name_rerelease="${_pkgname}-v$pkgver.1-x86_64-unknown-linux-gnu"
_archive_name="${_pkgname}-v$pkgver-x86_64-unknown-linux-gnu"
source=("https://github.com/obreitwi/asfa/releases/download/v$pkgver-1/${_archive_name_rerelease}.tar.gz")
sha256sums=("23c7c089486cb71d244b8b620bcd6e388bba32de0ad32c3e30392ff7da73e408")


package() {
    cd "${_archive_name}"
    install -Dm755 asfa -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    find man/man1 -type f -print0 \
        | xargs -0 install -Dm644 -t "$pkgdir/usr/share/man/man1"
    find example-config -type f -print0 \
        | xargs -0 install -Dm644 -t "$pkgdir/usr/share/doc/asfa/example-config"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/asfa"
    install -Dm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/asfa"
}
