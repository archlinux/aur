# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-session-standalone-git
pkgver=2.3.1.r3.g68c82da
pkgrel=1
pkgdesc='Session indicator for Wingpanel (without Gala dependencies)'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-session'
license=('GPL2')
groups=('pantheon-qq')
depends=('accountsservice' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
         lib{granite.so,handy})
makedepends=('git' 'gobject-introspection' 'wingpanel' 'meson' 'vala')
provides=('wingpanel-indicator-session')
conflicts=('wingpanel-indicator-session')
source=('git+https://github.com/elementary/wingpanel-indicator-session.git'
        wingpanel-indicator-session-standalone-{01-shutdown,02-logout}.patch)
sha256sums=('SKIP'
            'ffa0b3d28c7caf849b58b57e577e3d16d8d79153d2d4a30302b4673769605ce5'
            '2863a0c3163f2fb9c9273bf1bf64dccf3085147ebf916dea76bf261aebbdbb1e')

pkgver() {
  cd wingpanel-indicator-session
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd wingpanel-indicator-session
  patch -Np1 < ../wingpanel-indicator-session-standalone-01-shutdown.patch
  patch -Np1 < ../wingpanel-indicator-session-standalone-02-logout.patch
}

build() {
  arch-meson wingpanel-indicator-session build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
