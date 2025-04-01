# Maintainer: Ephemeral <theepehemral.txt@gmail.com>

# shellcheck disable=SC2034
_pkgname=waybar-lyric
pkgname=${_pkgname}-git
pkgver=0.2.2.r1.gef9d27d
pkgrel=1
pkgdesc="Get lyrics of currently playling song on waybar"
arch=('x86_64')
url="https://github.com/Nadim147c/waybar-lyric"
license=('AGPL-3.0-only')
makedepends=('go' 'git')
depends=("glibc")
source=("${_pkgname}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}" || exit

    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${_pkgname}" || exit

    go build -trimpath -ldflags "-s -w" -o "${_pkgname}"
}

package() {
    cd "$srcdir/${_pkgname}" || exit

    install -Dm755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/${_pkgname}/README.md"
}

