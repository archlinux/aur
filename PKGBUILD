# Maintainer: LJ <aur.lj at munally.com>
pkgname="bootvine-git"
_name="bootvine"
pkgver=0.1.3.ga7e33b4
pkgrel=1
pkgdesc=" A boot animation showing stages of systemd as a tree "
arch=('x86_64')
url="https://codeberg.org/wvhulle/bootvine"
license=('GPL-3.0-or-later')
source=(
  "${pkgname%-*}::git+https://codeberg.org/wvhulle/bootvine.git"
)
makedepends=('rust')
depends=('systemd' 'mkinitcpio')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-*}"
    git describe --long --tags --match 'v[0-9]*' |
        sed -E 's/^v//; s/-[0-9]+-g/.g/; s/-/./g'
}

build() {
    cd "$srcdir/${pkgname%-*}"
    cargo build --release
}

package() {
   "$srcdir/${pkgname%-*}/target/release/bootvine" install --destdir "$pkgdir" --initrd mkinitcpio
}
