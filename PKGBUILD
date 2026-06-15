# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=woodland
pkgver=2.1.1
pkgrel=1
pkgdesc="minimal Wayland compositor based on wlroots"
url="https://github.com/DiogenesN/woodland"
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=(
    'cairo'
    'dbus'
    'gdk-pixbuf2'
    'glibc'
    'glib2'
    'libdrm'
    'libinput'
    'librsvg'
    'libwlroots-0.18.so'
    'libxkbcommon'
    'libxml2'
    'pixman'
    'wayland'
)
makedepends=('stb')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/DiogenesN/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz
        0001_adj-makefile.patch)
b2sums=('f1409608ccf3ce7a16469085ab28a3dd57a4a17ea67666e0280ec3a261f03bab1d04b17097934d552cf94cef6c4ec50f9fea9eb016b6c1b8c587ee32b5ec7d86'
        '2fb12e9800bb86827f0a6ca16e4a33c7fe2a32f91aec63bec973e7cfb5cbed5e49f521b45a9db19e279c0596e743061e6a9cdd5dd1ca1caf814ca7b99976aceb')


prepare() {
  cd $pkgname-$pkgver
  patch -Np2 -i "${srcdir}"/0001_adj-makefile.patch
  cp -v Makefile.in Makefile
}

build() {
  cd $pkgname-$pkgver
  make PREFIX="/usr"
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

