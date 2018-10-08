# Maintainer: Davide Depau <davide@depau.eu>

_pkgname=authenticator
pkgname=$_pkgname-git
pkgver=0.2.4.r15.g7091453
pkgrel=1
pkgdesc="2FA code generator for GNOME "
arch=('any')
url="https://gitlab.gnome.org/World/Authenticator"
license=('GPL')
depends=('gtk3>=3.16.0' 'python>=3.3.0' 'glib2' 'python-pyotp' 'libsecret' 'python-pillow' 'pyzbar' 'python-gnupg')
makedepends=('meson' 'ninja' 'gobject-introspection' 'gnome-common')
provides=('authenticator')
conflicts=('authenticator')
source=("$_pkgname::git+https://gitlab.gnome.org/World/Authenticator.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  meson build --prefix=/usr --libdir=lib
}

build() {
  cd "$srcdir/$_pkgname"
  ninja -C build
}

package() {
  cd "$srcdir/$_pkgname"
  DESTDIR="${pkgdir}" ninja -C build install
}

