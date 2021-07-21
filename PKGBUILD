# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=dippi-git
pkgver=3.1.1.r0.g34bffad
pkgrel=1
pkgdesc='Calculate display info like DPI and aspect ratio'
arch=('x86_64')
url='https://github.com/cassidyjames/dippi'
license=('GPL3')
depends=('granite' 'libhandy')
makedepends=('git' 'meson' 'vala')
provides=('dippi')
conflicts=('dippi')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  git -C "$pkgname" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir/" meson install -C build
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "$pkgname/README.md"
}

# vim: ts=2 sw=2 et:
