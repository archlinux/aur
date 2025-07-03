# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Chris Tam <lchris314 at gmail dot com>
# Contributor: Daniel Micay <danielmicay at gmail dotcom>
# Contributor: David Herrmann <dh.herrmann@googlemail dot com>

pkgname=kmscon
pkgver=9.1.0
pkgrel=1
pkgdesc='Terminal emulator based on Kernel Mode Setting (KMS)'
arch=('x86_64')
url='https://github.com/Aetf/kmscon/'
license=('MIT')
depends=(
    'bash'
    'glibc'
    'glib2'
    'libdrm'
    'libgl'
    'libtsm'
    'libxkbcommon'
    'mesa'
    'pango'
    'pixman'
    'systemd-libs'
)
makedepends=('check' 'libxslt' 'docbook-xsl' 'linux-api-headers' 'meson')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Aetf/kmscon/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('56427c29cb581db22f7ebf76bc8678dc8948700cce39b60be001a88d1d297beb')

build() {
  meson setup build $pkgname-$pkgver \
   --prefix=/usr \
   --libexecdir=lib \
   -D werror=false
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
  install -Dm644 $pkgname-$pkgver/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
