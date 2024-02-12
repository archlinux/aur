# Maintainer: Alexei Gherman <aleksey.gherman at gmail dot com>

pkgname=panetrie
pkgver=1.0
pkgrel=1
pkgdesc='Config driven ALPM hook to synchronize Pacman and AUR installed package lists to a local directory.'
arch=('x86_64' 'i686')
license=('MIT')
depends=('sh')
makedepends=()
url='https://github.com/alexgherman/panetrie'
source=("$pkgname-$pkgver.tar.gz::https://github.com/alexgherman/panetrie/archive/refs/tags/v1.0.tar.gz")
sha256sums=('SKIP')
install="proto.install"

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    install -Dm755 ./src/panetrie.sh "$pkgdir/usr/share/libalpm/scripts/panetrie"
    mkdir -p "$pkgdir/usr/bin"
    ln -s /usr/share/libalpm/scripts/panetrie "$pkgdir/usr/bin/panetrie"
    install -Dm644 ./src/panetrie.hook "$pkgdir/usr/share/libalpm/hooks/panetrie.hook"
    install -Dm644 ./etc/panetrie.conf "$pkgdir/usr/share/panetrie/panetrie.conf.example"

    install -Dm644 ./README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 ./docs/* -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 ./LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
