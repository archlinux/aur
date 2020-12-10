# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-user-accounts-git
pkgver=2.3.2.r23.g156767a
pkgrel=1
pkgdesc='Switchboard User Accounts Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-useraccounts'
license=('GPL3')
groups=('pantheon-unstable')
depends=('accountsservice' 'cairo' 'gdk-pixbuf2' 'glib2' 'glibc'
         'gnome-desktop' 'gtk3' 'libgee' 'libpwquality' 'polkit'
         'libgranite.so' 'libswitchboard-2.0.so' 'libhandy')
makedepends=('git' 'gobject-introspection' 'granite' 'meson'
             'switchboard' 'vala')
provides=('switchboard-plug-user-accounts')
conflicts=('switchboard-plug-user-accounts')
source=("switchboard-plug-user-accounts::git+https://github.com/elementary/switchboard-plug-useraccounts.git")
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-user-accounts

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson switchboard-plug-user-accounts build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
