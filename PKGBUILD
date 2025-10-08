_pkgname=lsmount
pkgbase=lsmount
pkgname=lsmount-git
pkgver=v0.2.4.r3.g9b6e92d
pkgrel=1
epoch=
pkgdesc="lsmount is a simple formatter, colorizer and filter for /proc/mounts written in C"
arch=(x86_64)
url="https://www.lsmount.org"
license=('isc')
groups=()
depends=('libconfig' 'ncurses')
makedepends=('asciidoc' 'gzip' 'xmlto' 'debhelper')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/Llandon/lsmount.git" 'missing-termcap-fix.patch')
noextract=()
sha256sums=(
    'SKIP'
    '63d90ab2135655abd60b830cc4f889ac524fa1347eae700dd504c4b87ec47f55'
)
validpgpkeys=()

pkgver() {
    cd "$pkgbase"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgbase"
    patch -p0 < "${srcdir}/missing-termcap-fix.patch"
}

build() {
    cd "$pkgbase"
    
    make
    make manpage
}

package() {
    cd "$pkgbase"
    
    install -Dm755 lsmount "$pkgdir/usr/bin/lsmount"
    install -Dm644 share/lsmount.rc.default "$pkgdir/etc/lsmountrc"
    install -Dm644 doc/lsmount.1.gz "$pkgdir/usr/share/man/man1/lsmount.1.gz"
}
