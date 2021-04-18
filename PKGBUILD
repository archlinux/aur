# Maintainer: Noah Jelen <noahtjelen@gmail.com>

pkgname=the-rock-git
pkgver=0.3.0
pkgrel=1
pkgdesc="A command line King James bible viewer"
arch=('i686' 'x86_64')
url="https://gitlab.com/NoahJelen/the-rock"
license=('GPL')
depends=('ncurses' 'glibc' 'gcc-libs')
makedepends=('cargo' 'git' 'gzip')
source=("git+https://gitlab.com/NoahJelen/the-rock")
conflicts=('the-rock' 'bible-kjv')
md5sums=('SKIP')

build() {
    cd "the-rock/"
    cargo build --release
    cd target/release
    ln -sf the_rock bible
}

package() {
    #the package contents
    cd "the-rock/"
    mkdir -p "$pkgdir/usr/lib/the_rock"
    mkdir -p "$pkgdir/usr/share/man/man1/"
    install -Dt "$pkgdir/usr/bin" -m755 target/release/the_rock
    install -Dt "$pkgdir/usr/bin" -m755 target/release/bible
    install -Dt "$pkgdir/usr/lib/the_rock/" bible.rawtext
    install -Dt "$pkgdir/usr/share/applications/" the_rock.desktop
    install -Dt "$pkgdir/usr/lib/the_rock/" icon.png

    #the documentation
    install -Dt "$pkgdir/usr/share/man/man1" man/the_rock.1
    install -Dt "$pkgdir/usr/share/man/man1" man/bible.1
    gzip "$pkgdir/usr/share/man/man1/bible.1"
    gzip "$pkgdir/usr/share/man/man1/the_rock.1"
}
