# Maintainer: Ash Price eisleggje@gmail.com

pkgname=stc-syncthing-git
_pkgname=stc
pkgver=1.5.4.r2.gb6f1822
pkgrel=1
pkgdesc='Command line tool for syncthing'
arch=('any')
url="https://github.com/tenox7/${_pkgname}"
license=('Apache-2.0')
depends=()
makedepends=("go" "git")
provides=("$_pkgname=${pkgver%%.g*}")
conflicts=("stc-git" "$_pkgname")
_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')


pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  go build .
}

package() {
  cd "$_pkgsrc"
  install -Dm755 stc "${pkgdir}/usr/bin/stc"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
