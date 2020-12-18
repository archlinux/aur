# Contributor: Nathaniel Cook <nvcook42 /at/ gmail.com>

pkgname=pmars-sdl-git
_pkgname=pMARS
pkgver=v0.9.2.r17.ge7e8d08
pkgrel=1
pkgdesc="Reference implementation of Corewar game with SDL support"
arch=('i686' 'x86_64' 'armv7hf')
url="http://sourceforge.net/projects/corewar/"
license=('GPL2')
conflicts=(pmars)
depends=(libx11 sdl ncurses)
makedepends=(gcc make)
source=(git+http://github.com/nathanielc/pMARS.git
    sdl.patch
    )
sha1sums=('SKIP'
          'b519084387385351223dedb3f69efbbc666a9b22')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_pkgname/src
    make
    cp pmars pmars-server
    patch -p2 < ../../sdl.patch
    make
}

package() {
    cd $_pkgname
    # install binaries
    install -D -m 0755 src/pmars-server "$pkgdir/usr/bin/pmars-server"
    install -D -m 0755 src/pmars "$pkgdir/usr/bin/pmars"

    # install docs
    install -D -m 0644 doc/pmars.6 "$pkgdir/usr/share/man/man6/pmars.6"
    install -D -m 0644 doc/corewar-faq.html "$pkgdir/usr/share/pmars/doc/corewar-faq.html"
    install -D -m 0644 doc/primer.94 "$pkgdir/usr/share/pmars/doc/primer.94"
    install -D -m 0644 doc/primer.cdb "$pkgdir/usr/share/pmars/doc/primer.cdb"
    install -D -m 0644 doc/redcode.ref "$pkgdir/usr/share/pmars/doc/redcode.ref"
    install -D -m 0644 doc/whatsnew.080 "$pkgdir/usr/share/pmars/doc/whatsnew.080"

    # install example configs
    install -D -m 0644 config/94x.opt "$pkgdir/usr/share/pmars/config/94x.opt"
    install -D -m 0644 config/icws.opt "$pkgdir/usr/share/pmars/config/icws.opt"
    install -D -m 0644 config/mw.mac "$pkgdir/usr/share/pmars/config/mw.mac"
    install -D -m 0644 config/pmars.mac "$pkgdir/usr/share/pmars/config/pmars.mac"
    install -D -m 0644 config/x.opt "$pkgdir/usr/share/pmars/config/x.opt"

}
