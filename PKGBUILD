# Maintainer: Daniel Souza <aur at posix dot dev dot br>

_pkgname="yarr"
_gitauthor="nkanaev"
_gitbranch="master"
_outdir="_output/linux"

pkgname="${_pkgname}-git"
pkgver=v2.3.r41.g95ebbb9
pkgrel=3
pkgdesc="Self-hosted RSS reader with Vue.js front and Go/SQLite back."
arch=("any")
url="https://github.com/${_gitauthor}/${_pkgname}"
license=("MIT")
groups=()
depends=()
makedepends=("go" "make" "git")
optdepends=()
provides=("${_pkgname}")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/${_gitauthor}/${_pkgname}.git#branch=${_gitbranch}")
noextract=()
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  # Use tags but fallback to revision
  ( set -o pipefail
    git describe --tags --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
