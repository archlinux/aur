# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: DavidK <david_king at softhome dot net>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=deutex-devel
pkgver=4.4.902.r14.g89e5a6a
pkgrel=1
pkgdesc="A WAD file composer for Doom, Heretic, Hexen and Strife"
arch=('i686' 'x86_64')
url="http://www.teaser.fr/~amajorel/deutex/"
license=('custom')
depends=('glibc')
makedepends=('git')
provides=('deutex')
conflicts=('deutex')
source=(git+https://github.com/chungy/deutex.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/deutex"
  git describe | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    # Configure
    cd "$srcdir/deutex"
    ./configure 

    # Compile and install
    make 
}

package() {
    cd "$srcdir/deutex"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/man/man6"
    make BINDIR="$pkgdir/usr/bin" \
        MANDIR="$pkgdir/usr/share/man" install 
    # Install license
    install -Dm 644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
