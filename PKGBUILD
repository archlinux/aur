# Maintainer: Filippo Squillace <feel dot sqoox at gmail dot com>
# More details on how to change this file:
# https://wiki.archlinux.org/index.php/PKGBUILD
# https://wiki.archlinux.org/index.php/Creating_packages

pkgname=pearl-git
pkgver=r71.2915577
pkgrel=1
pkgdesc="Package manager for dotfiles, plugins, programs and any form of code accessible via git. Allow to easily share and sync packages across systems and have them ready to work out of the box."
arch=('any')
url="https://github.com/pearl-core/pearl"
license=('GPL')
groups=()
depends=('git')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=${pkgname%-git}.install
# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.
source=('pearl::git+https://github.com/pearl-core/pearl.git#branch=master')
noextract=()
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/${pkgname%-git}"

# The examples below are not absolute and need to be adapted to each repo. The
# primary goal is to generate version numbers that will increase according to
# pacman's version comparisons with later commits to the repo. The format
# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
# are not available, is recommended.

# Git, tags available
#	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

package() {
    cd "$srcdir/${pkgname%-git}"

    mkdir -p "${pkgdir}/opt/"
    cp -R "${srcdir}/${pkgname%-git}" "${pkgdir}/opt/${pkgname%-git}"

    mkdir -p "${pkgdir}/etc/profile.d/"
    echo "export PATH=\$PATH:/opt/${pkgname%-git}/bin" > "${pkgdir}/etc/profile.d/${pkgname%-git}"
    chmod +x "${pkgdir}/etc/profile.d/${pkgname%-git}"
    echo "set -x PATH \$PATH /opt/${pkgname%-git}/bin" > "${pkgdir}/etc/profile.d/${pkgname%-git}.fish"
    chmod +x "${pkgdir}/etc/profile.d/${pkgname%-git}.fish"
}

# vim:set ts=2 sw=2 et:
