# Maintainer: Slash <demodevil5[at]yahoo[dot]com>
# Contributor: flu

pkgname=mpc-git
pkgver=0.34.17.g3ec5205
pkgrel=1
pkgdesc="A minimalist command line interface to MPD"
arch=('i686' 'x86_64')
url="https://www.musicpd.org/clients/mpc/"
license=('GPL2')
depends=('libmpdclient')
makedepends=('git' 'meson' 'python-sphinx')
optdepends=('bash-completion')
conflicts=('mpc')
provides=('mpc')
replaces=('mpc-svn')
source=('mpc::git+https://github.com/MusicPlayerDaemon/mpc.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/mpc"

    git describe | sed 's/^release-//; s/-/./g; s/^v//g'
}

build() {
    cd "${srcdir}/mpc"

    # Build
    arch-meson . build
    ninja -C build
}

package() {
    cd "${srcdir}/mpc"

    # Install Package
    DESTDIR="${pkgdir}" ninja -C build install

    # Install Bash Completion File
    install -D -m 644 "${srcdir}/mpc/contrib/mpc-completion.bash" \
        "${pkgdir}/usr/share/bash-completion/completions/mpc"
}

