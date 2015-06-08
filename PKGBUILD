# Contributor: Sean Bartell <yotann@yotann.org>

pkgname=schismtracker-hg
pkgver=2915
pkgrel=1
pkgdesc="A reimplementation of the Impulse Tracker music editor."
arch=('i686' 'x86_64')
url="http://schismtracker.org/"
license=('GPL')
depends=(sdl gcc-libs libxv)
makedepends=(mercurial)
conflicts=(schismtracker schismtracker-cvs)
provides=(schismtracker schismtracker-cvs)
source=('hg+http://schismtracker.org/hg/')
md5sums=('SKIP')

build() {
    cd hg
    autoreconf -i
    ./configure --prefix=/usr --enable-mercurial
    make
}

package() {
    cd hg
    make DESTDIR="$pkgdir/" install
    install -Dm644 icons/schism-icon-128.png \
        "$pkgdir/usr/share/icons/schism-icon-128.png"
    install -Dm644 icons/schism-itf-icon-128.png \
        "$pkgdir/usr/share/icons/schism-itf-icon-128.png"
    install -Dm644 sys/fd.org/schism.desktop \
        "$pkgdir/usr/share/applications/schism.desktop"
    install -Dm644 sys/fd.org/itf.desktop \
        "$pkgdir/usr/share/applications/itf.desktop"
    install -Dm644 README \
        "$pkgdir/usr/share/doc/schismtracker/README"
}
