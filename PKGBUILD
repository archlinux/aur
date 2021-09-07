# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-session-standalone-git
pkgver=2.3.0.r45.g498387b
pkgrel=2
pkgdesc='Session indicator for Wingpanel (without Gala dependencies)'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-session'
license=('GPL2')
groups=('pantheon-qq')
depends=('accountsservice' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
         lib{{granite,wingpanel}.so,handy})
makedepends=('git' 'gobject-introspection' 'granite' 'meson' 'vala'
             'wingpanel')
provides=('wingpanel-indicator-session')
conflicts=('wingpanel-indicator-session')
source=('git+https://github.com/elementary/wingpanel-indicator-session.git'
        wingpanel-indicator-session-standalone-{01-shutdown,02-logout}.patch)
sha256sums=('SKIP'
            'ca09d91061c301a12cae9e33f958cced8c6e4ee1d14dca4c239c8015191f73eb'
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
