# Maintainer: csmantle <aur at csmantle dot top>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

_pkgname='jai'
pkgname="${_pkgname}-git"
pkgver=0.2.r1.g46f507a
pkgrel=1
pkgdesc='An ultra lightweight jail for AI CLIs on modern Linux'
arch=('x86_64' 'loong64')
url='https://github.com/stanford-scs/jai'
license=('GPL-3.0-or-later')
depends=('acl' 'gcc-libs' 'glibc' 'util-linux-libs')
makedepends=('git' 'pandoc')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('jai::git+https://github.com/stanford-scs/jai.git')
sha256sums=('SKIP')

pkgver() {
        cd "$srcdir"/jai
        git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
        cd "$srcdir"/jai
        ./autogen.sh
        ./configure --prefix='/usr'
        make V=1
}

check() {
        cd "$srcdir"/jai
        make V=1 check
}

package() {
        cd "$srcdir"/jai
        make V=1 DESTDIR="$pkgdir" install
}
