# Maintainer: Tommaso Sardelli <lacapannadelloziotom [at] gmail [dot] com>

_pkgname=bashmarks
pkgname=${_pkgname}-git
pkgver=r48.264952f
pkgrel=1
pkgdesc='A shell script that allows you to save and jump to commonly used directories'
arch=('any')
url="https://github.com/huyng/${_pkgname}"
license=('BSD')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$pkgname.install"
source=("git+https://github.com/huyng/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm644 bashmarks.sh $pkgdir/usr/share/$_pkgname/${_pkgname}.sh
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
