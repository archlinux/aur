# Maintainer: Guilherme Felipe <guilhermefelipecgs@gmail.com>

pkgname=zytrax-git
pkgver=1.0.alpha.r9.g16838b3
pkgrel=1
pkgdesc="Easy to use, tracker-inspired music sequencer."
arch=('i686' 'x86_64')
url="http://zytrax.org/"
license=('MIT')
makedepends=('scons' 'gcc')
depends=('gtkmm3' 'libpulse')
optdepends=('vst-plugins')
source=(
    "$pkgname::git://github.com/reduz/zytrax.git"
    "zytrax.desktop"
)
sha256sums=(
    'SKIP'
    '5058a5b3c2070e7d59db8cb8f14fd45538718a80e79fc8f4de4d62c1252521e8'
)

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
    cd "$srcdir/$pkgname"
    scons -j$(nproc)
}

package() {
    cd "$srcdir"
    install -Dm644 zytrax.desktop "$pkgdir/usr/share/applications/zytrax.desktop"
    cd "$srcdir/$pkgname"
    install -Dm755 bin/zytrax "$pkgdir/usr/bin/zytrax"
    install -Dm644 zytrax_logo.png "$pkgdir/usr/share/pixmaps/zytrax.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}