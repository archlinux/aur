# Maintainer: Moritz Bruder <muesli4 at gmail dot com>
pkgname=gmpc-git
pkgver=11.8.16.r442.g28e1441f
pkgrel=2
pkgdesc='A graphical MPD client written in Gtk3 including libnotify support'
arch=('x86_64' 'i686')
url='https://github.com/DaveDavenport/gmpc'
depends=('libmpd' 'libsoup' 'sqlite' 'hicolor-icon-theme' 'xdg-utils' 'libnotify' 'glyr' 'gtk3')
makedepends=('gob2' 'intltool' 'vala' 'git')
conflicts=('gmpc')
provides=('gmpc')
install='gmpc.install'
source=($pkgname::git+https://github.com/DaveDavenport/gmpc.git)
md5sums=(SKIP)

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed -r 's/release\.(.*)/\1/'
}

build() {
    cd "$srcdir/$pkgname"

    NOCONFIGURE=1 ./autogen.sh
    ./configure --prefix=/usr --enable-libnotify
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" install
}

