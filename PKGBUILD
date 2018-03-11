# Maintainer: Jonas Strassel <info@jonas-strassel.de>

pkgname=budgie-extras-git
pkgver=v0.4.2.r5.g64846b0
pkgrel=1
pkgdesc="Additional Budgie Desktop enhancements for the user experience https://ubuntubudgie.org"
arch=('any')
license=('GPL3')
depends=('budgie-desktop' 'xorg-xprop' 'xorg-xinput' 'xorg-xrandr' 'xdotool' 'wmctrl' 'xprintidle' 'python-pyudev') 
makedepends=('gobject-introspection' 'meson' 'ninja' 'vala')
source=('budgie-extras::git+https://github.com/UbuntuBudgie/budgie-extras')
sha256sums=('SKIP')

#url="https://github.com/UbuntuBudgie/budgie-extras"

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${pkgname%-git}"
    mkdir -p build
    cd "$srcdir/${pkgname%-git}/build"
    meson --prefix /usr --buildtype=plain ..
    ninja
}

package() {
    cd "$srcdir/${pkgname%-git}/build"
    DESTDIR="${pkgdir}" ninja install
}
