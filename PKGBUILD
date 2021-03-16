# Maintainer: Noah Jelen <noahtjelen@gmail.com>

pkgname=the-rock
pkgver=0.1.1
pkgrel=1
pkgdesc="A command line King James bible viewer"
arch=('i686' 'x86_64')
url="https://gitlab.com/NoahJelen/the-rock"
license=('GPL')
depends=('ncurses')
makedepends=('cargo')
source=("https://gitlab.com/NoahJelen/the-rock/-/archive/0.1.1/the-rock-0.1.1.zip")
conflicts=('the-rock-git')
md5sums=('SKIP')

build() {
    ls
    echo $PWD
    cd "the-rock-0.1.1"
    cargo build --release
    cd target/release
    ln -sf the_rock bible
}

package() {
    #the package contents
    cd "the-rock-0.1.1"
    mkdir -p "$pkgdir/usr/lib/the_rock"
    mkdir -p "$pkgdir/usr/share/man/man1/"
    install -Dt "$pkgdir/usr/bin" -m755 target/release/the_rock
    install -Dt "$pkgdir/usr/bin" -m755 target/release/bible
    install -Dt "$pkgdir/usr/lib/the_rock/" bible.rawtext
    install -Dt "$pkgdir/usr/share/applications/" the_rock.desktop
    install -Dt "$pkgdir/usr/lib/the_rock/" icon.png

    #the documentation
    sudo install -Dt "$pkgdir/usr/share/man/man1" man/the_rock.1
    sudo install -Dt "$pkgdir/usr/share/man/man1" man/bible.1
    gzip "$pkgdir/usr/share/man/man1/bible.1"
    gzip "$pkgdir/usr/share/man/man1/the_rock.1"
}
