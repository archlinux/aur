# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Chris Tam <lchris314 at gmail dot com>
# Contributor: Daniel Micay <danielmicay at gmail dotcom>
# Contributor: David Herrmann <dh.herrmann@googlemail dot com>

pkgname=kmscon
pkgver=9.0.0
pkgrel=1
pkgdesc='Terminal emulator based on Kernel Mode Setting (KMS)'
arch=('x86_64')
url='https://github.com/Aetf/kmscon/'
license=('MIT')
depends=('systemd' 'libdrm' 'mesa' 'libgl' 'pango' 'libxkbcommon'
         'xkeyboard-config' 'libtsm')
makedepends=('libxslt' 'docbook-xsl' 'linux-api-headers' 'meson')
source=("https://github.com/Aetf/kmscon/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('48be605bd874260d9bd7a59e82421ceacf875e4a2c5dba9c62d7f0359df694b6')

build() {
  meson build $pkgname-$pkgver \
   --prefix=/usr \
   --libexecdir=lib \
   -D werror=false
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
  install -Dm644 $pkgname-$pkgver/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
#  install -d "$pkgdir/usr/lib/systemd/system"
#  cp docs/kmscon{,vt@}.service "$pkgdir/usr/lib/systemd/system/"
}
