# Maintainer: LLL2yu <lll2yu@protonmail.com>
 
pkgname="authenticator"
fullpkgname="Authenticator"
pkgver=0.2.1
pkgrel=2
pkgdesc="Two-Factor Authentication code generator for Gnome"
arch=('x86_64' 'i686')
url="https://github.com/bilelmoussaoui/Authenticator" 
license=("GPL-2.0")
depends=('python' 'gtk3' 'python-pyotp' 'python-pillow' 'pyzbar' 'libsecret' 'gnome-screenshot')
makedepends=('meson' 'ninja' 'gobject-introspection' 'glib2' 'pkg-config' 'desktop-file-utils')
provides=('authenticator')
source=("https://github.com/bilelmoussaoui/${fullpkgname}/archive/${pkgver}.tar.gz")
sha256sums=('251b7b2717b09c2f10eed1e1b6a5ac169c3fe4885e54e5003f8e259e2213448e')
build() {
    cd ${fullpkgname}-${pkgver}

    meson builddir --prefix=/usr/ -Denable-tests=false
    ninja -C builddir
}

package() {
    cd ${fullpkgname}-${pkgver}

    DESTDIR="${pkgdir}" ninja -C builddir install
}
