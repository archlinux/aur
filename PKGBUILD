# Maintainer: Jason Nader <jason *add-dot-here* nader *you-know-what-goes-here* protonmail.com>

pkgname=slurp-git
_pkgname=slurp
pkgver=v1.3.2.r7.gfa0d21f
pkgrel=2
epoch=1
pkgdesc='Select a region in a Wayland compositor'
arch=('x86_64')
url='https://github.com/emersion/slurp'
license=('MIT')
depends=('cairo' 'wayland' 'libxkbcommon')
makedepends=('git' 'meson' 'scdoc' 'wayland-protocols')
provides=('slurp')
conflicts=('slurp')
source=('git+https://github.com/emersion/slurp')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    cd $_pkgname
    install -D -m 0644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -D -m 0644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
