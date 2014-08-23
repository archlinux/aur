# Maintainer: Slash <demodevil5[at]yahoo[dot]com>
# Contributor: flu

pkgname=mpc-git
pkgver=0.26
pkgrel=1
pkgdesc="A minimalist command line interface to MPD"
arch=('i686' 'x86_64')
url="http://mpd.wikia.com"
license=('GPL2')
depends=('libmpdclient')
makedepends=('git')
optdepends=('bash-completion')
conflicts=('mpc')
provides=('mpc')
replaces=('mpc-svn')
source=('git://git.musicpd.org/master/mpc.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/mpc"

    git describe | sed 's/^release-//; s/-/./g; s/^v//g'
}

build() {
    cd "${srcdir}/mpc"

    # Configure Source
    ./autogen.sh --prefix=/usr

    # Build Source
    make
}

package() {
    cd "${srcdir}/mpc"

    # Install Source
    make prefix="${pkgdir}/usr" install

    # Install Bash Completion File
    install -D -m 644 "${srcdir}/mpc/doc/mpc-completion.bash" \
        "${pkgdir}/etc/bash_completion.d/mpc"
}

