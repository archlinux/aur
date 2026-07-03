# Maintainer: mfw <espadonne@outlook.com>

pkgname=frt
pkgver=0.1.0
pkgrel=1
pkgdesc='Fast byte-for-byte find(1) clone in C (ferret; findutils 4.10.0)'
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/tenseleyFlow/ferret'
license=('MIT')
depends=('glibc' 'liburing')
# Release asset, not the generated tag archive: it bundles the frtdate submodule
# (deps/frtdate), which GitHub's archive/refs/tags tarballs leave out. Upstream's
# 'ferret' name and its /usr/bin/ferret are already taken on Arch, so this ships
# the identical 'frt' binary the project also provides.
source=("https://github.com/tenseleyFlow/ferret/releases/download/v$pkgver/ferret-$pkgver.tar.gz")
sha256sums=('95c5cad610c362c1b679dc41169a1e44f86a4ad8bb287295f8f4f792a5b47c3f')

build() {
    cd "ferret-$pkgver"
    ./configure
    make release
}

check() {
    cd "ferret-$pkgver"
    ./ferret --version | grep -q "ferret $pkgver"
}

package() {
    cd "ferret-$pkgver"
    install -Dm755 ferret "$pkgdir/usr/bin/frt"
    install -Dm644 doc/ferret.1 "$pkgdir/usr/share/man/man1/frt.1"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
