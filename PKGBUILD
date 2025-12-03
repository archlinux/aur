# Maintainer: GreyXor <greyxor@protonmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Chris Tam <lchris314 at gmail dot com>
# Contributor: Daniel Micay <danielmicay at gmail dotcom>
# Contributor: David Herrmann <dh.herrmann@googlemail dot com>

pkgname=kmscon
pkgver=9.2.1
pkgrel=1
pkgdesc='Kernel Mode Setting (KMS) and DRM based virtual Console Emulator'
arch=('x86_64')
url='https://github.com/kmscon/kmscon'
license=('MIT')
backup=('etc/kmscon/kmscon.conf')
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
    'systemd-libs'
)
makedepends=('check' 'libxslt' 'docbook-xsl' 'linux-api-headers' 'meson')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('6fb3852e4941b9274af5debc17f668b8ca2c784f2a1c9cb56079d509ae3cb896bea58190d71f6913edc4282b1f9d1132688b2bde221bb72c2725519d9291d23d')

build() {
    arch-meson "$pkgname-$pkgver" build
    meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
  install -Dm644 $pkgname-$pkgver/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
