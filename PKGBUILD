# Maintainer: Ephemeral <theepehemral.txt@gmail.com>

# shellcheck disable=SC2034
_pkgname=waybar-lyric
pkgname=${_pkgname}-git
pkgver=0.10.0.r48.g90959cb
pkgrel=2
pkgdesc="A waybar module for song lyric"
arch=('x86_64')
url="https://github.com/Nadim147c/waybar-lyric"
license=('AGPL-3.0-only')
makedepends=('go' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-bin")
depends=("glibc")
source=("${_pkgname}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}" || exit

    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${_pkgname}" || exit
    make
}

package() {
    cd "$srcdir/${_pkgname}" || exit
    make install PREFIX="$pkgdir/usr/"
}

