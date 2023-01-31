# Maintainer: Daniel Souza <aur at posix dot dev dot br>

_pkgname="yarr"
_outdir="_output/linux"
pkgname=yarr-git
pkgver=v2.3.r27.g91da774
pkgrel=4
pkgdesc="yet another rss reader."
arch=("any")
url="https://github.com/nkanaev/yarr"
license=("MIT")
source=("git+https://github.com/nkanaev/yarr")
depends=()
makedepends=("go" "make" "git")
sha1sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build(){
  cd "$_pkgname"
  make build_linux
}

package() {
  cd "$_pkgname"
  install -Dm755 "${_outdir}/yarr" "$pkgdir/usr/bin/yarr"
  install -Dm0644 license "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
