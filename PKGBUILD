# Maintainer: initMayday <initMayday@protonmail.com>

_pkgname="maypaper"
pkgname="$_pkgname"
pkgrel=1
pkgver=7f9c25a
pkgdesc='The super dynamic wallpaper tool!'
arch=('any')
url='https://github.com/initMayday/maypaper.git'
makedepends=('git' 'rust' 'cargo' 'qt6-base' 'qt6-declarative' 'qt6-webengine')
depends=('qt6-base' 'qt6-wayland' 'qt6-webengine' 'qt6-declarative' 'layer-shell-qt')
provides=("$_pkgname")
conflicts=("$_pkgname")
license=('AGPL-3.0-or-later')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

options=(!lto)

pkgver() {
    cd "$_pkgname"
      git describe --tags --long --always 2>/dev/null \
    | sed 's/^v//; s/-/./g'
}

prepare() {
    cd "$_pkgname"
    tag=$(git describe --tags --abbrev=0 2>/dev/null) && git checkout -f "$tag" || :
}

build() {
    cd "$_pkgname"
    cargo build --release
}

package() {
  cd "$_pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/maypaper \
    target/release/mypctl \
    target/release/myptmp
}


