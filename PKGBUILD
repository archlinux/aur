# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>
# Note: Package builds on PKGBUILD from ABS, provides latest version from
#       git master branch of Seahorse.
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Michel Brabants <michel.linux@tiscali.be>
pkgname=seahorse-git
pkgver=3.30+25+g19bb9495
pkgrel=1
pkgdesc="GNOME application for managing encryption keys and passwords in the
GNOME Keyring."
url="https://wiki.gnome.org/Apps/Seahorse"
arch=(x86_64)
license=(GPL)
depends=(gtk3 gcr libsecret libsoup gpgme gnome-keyring)
conflicts=('seahorse')
provides=('seahorse')
makedepends=(libldap yelp-tools gobject-introspection vala git meson)
provides=(x11-ssh-askpass)

# Tag: 3.30.0: 7e0535880a2010df356d9c468c68cdcb77b45431
#_commit=7e0535880a2010df356d9c468c68cdcb77b45431
#source=("git+https://gitlab.gnome.org/GNOME/seahorse.git#commit=$_commit")

source=("git+https://gitlab.gnome.org/GNOME/seahorse.git")
sha256sums=('SKIP')

pkgver() {
  cd seahorse/
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd seahorse/
}

build() {
  arch-meson seahorse build
  ninja -C build
}

check() {
  cd build
  meson test
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
