# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Chris Tam <lchris314 at gmail dot com>
# Contributor: Daniel Micay <danielmicay at gmail dotcom>
# Contributor: David Herrmann <dh.herrmann@googlemail dot com>

pkgname=kmscon
pkgver=9.2.0
pkgrel=1
pkgdesc='Terminal emulator based on Kernel Mode Setting (KMS)'
arch=('x86_64')
url='https://github.com/kmscon/kmscon'
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('69b8e63d2a48514d5802fba7a284ae6ce307488f1c47ac523582d599141ed4cf')

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
