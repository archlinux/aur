# Maintainer: LLL2yu <lll2yu@protonmail.com>
 
pkgname="authenticator"
pkgver=0.2.4
pkgrel=1
pkgdesc="2FA code generator for GNOME"
arch=('any')
url="https://gitlab.gnome.org/World/Authenticator"
license=("GPL-2.0")
depends=('python>=3.3.0' 'gtk3>=3.16.0' 'python-pyotp' 'glib2' 'python-pillow' 'libsecret' 'pyzbar' 'python-gnupg') 
makedepends=('meson>=0.42' 'ninja' 'gobject-introspection' 'gnome-common')
provides=('authenticator')
source=("$pkgname::git+https://gitlab.gnome.org/World/Authenticator.git?unsigned#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"
    meson build --prefix=/usr/ --libdir=lib
}

build(){
    cd "$srcdir/$pkgname"
    ninja -C build
}

package() {
    cd "$srcdir/$pkgname"
    DESTDIR="${pkgdir}" ninja -C build install
}
