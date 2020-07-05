# Maintainer: Maxwell Beck <max@ryt.one>
pkgname=libsidplayfp-experimental-svn
pkgver=r2731
pkgrel=1
pkgdesc="Library to play Commodore 64 music, derived from libsidplay2, experimental development version"
arch=(x86_64)
url="https://sourceforge.net/projects/sidplay-residfp/"
license=('GPL')
groups=()
depends=()
makedepends=('subversion' 'vice' 'xa' 'unittestpp')
optdepends=('vice: better SID support')
provides=('libsidplayfp=2.0.4')
conflicts=(libsidplayfp)
replaces=()
backup=()
options=()
install=
source=("$pkgname::svn://svn.code.sf.net/p/sidplay-residfp/code/branches/libsidplayfp-experimental")
noextract=()
md5sums=("SKIP")

pkgver() {
    cd "$pkgname"
    printf "r%s" "$(svnversion | tr -d 'A-z')"
}

build() {
    cd "$pkgname"
    autoreconf -i
    ./configure --enable-tests --prefix=/usr
    make
}

check() {
    cd "$pkgname"
    make check
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir/" install
    install -d "$pkgdir/usr/share/sidplayfp"
    ln -t "$pkgdir/usr/share/sidplayfp/" -s "/usr/lib/vice/C64/kernal"
    ln -t "$pkgdir/usr/share/sidplayfp/" -s "/usr/lib/vice/C64/basic"
    ln -t "$pkgdir/usr/share/sidplayfp/" -s "/usr/lib/vice/C64/chargen"
}
