# Maintainer: Moritz Bruder <muesli4 at gmail dot com>
pkgname=gmpc-git
pkgver=11.8.16.r424.gab71845
pkgrel=1
pkgdesc='A graphical MPD client written in Gtk3 including libnotify support'
arch=('x86_64' 'i686')
url='http://gmpclient.org/home'
depends=('libunique' 'libmpd-git' 'libsoup' 'sqlite' 'hicolor-icon-theme' 'xdg-utils' 'libnotify' 'glyr')
makedepends=('gob2' 'intltool' 'vala' 'git')
conflicts=('gmpc')
install='gmpc.install'
source=($pkgname::git://github.com/DaveDavenport/gmpc.git)
md5sums=(SKIP)

pkgver() {
    cd "$pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed -r 's/release\.(.*)/\1/'
}

build() {
    cd "$pkgname"

    NOCONFIGURE=1 ./autogen.sh
    ./configure --prefix=/usr --enable-libnotify
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
}

