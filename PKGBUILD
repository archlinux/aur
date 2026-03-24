# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=woodland
pkgver=2.1.0
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
b2sums=('c8fa7a3d2386691cbe237b4efb61d4d4639f431ce265de41ecef4a64284a2b36acb0f74c2050281976e2688db1c1156617dab9d61be2bbf615e7d5fe191164ac'
        'b9b57fcabd0f28fb3620383deab94b15dd8a888a4ee8f4ddc7f700b284d689a54f66e7e790aafad4122da439d3e9274f76cb57e15dfa28f9856ef88fab89df01')


prepare() {
  cd $pkgname-$pkgver
  patch -Np2 -i "${srcdir}"/0001_adj-makefile.patch
}

build() {
  cd $pkgname-$pkgver
  cp -v Makefile.in Makefile
  make PREFIX="/usr"
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

