# Maintainer: GreyXor <greyxor@protonmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Chris Tam <lchris314 at gmail dot com>
# Contributor: Daniel Micay <danielmicay at gmail dotcom>
# Contributor: David Herrmann <dh.herrmann@googlemail dot com>

pkgname=kmscon
pkgver=9.2.0
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
b2sums=('949f8d05d773ba877ec6546577fb24c7397204554ec4ec079b798cfa7a38312db383797b7d9182bec939770bec6270d9f01dcb9e512baef6c7a14d8c5e0aa704')

build() {
    arch-meson "$pkgname-$pkgver" build
    meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
  install -Dm644 $pkgname-$pkgver/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
