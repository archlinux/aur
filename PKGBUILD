# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-elementary-tweaks-git
pkgver=0.0.1.r45.g7032d22
pkgrel=1
pkgdesc='Elementary Tweaks plug for Switchboard'
arch=('i686' 'x86_64')
url='https://github.com/elementary-tweaks/elementary-tweaks'
license=('GPL3')
groups=('pantheon-unstable')
depends=('gconf' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('git' 'meson' 'vala')
provides=(switchboard-plug-elementary-tweaks{,-bzr})
conflicts=('switchboard-plug-elementary-tweaks')
source=('switchboard-plug-elementary-tweaks::git+https://github.com/elementary-tweaks/elementary-tweaks.git'
        'public-to-protected.patch')
sha256sums=('SKIP'
            '3fa13fad3cf1d41b977d6834fa4ea62fe2d015912e8193fccfcc748245a45ff1')

pkgver() {
  cd switchboard-plug-elementary-tweaks
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd switchboard-plug-elementary-tweaks
  patch -Np0 < ../public-to-protected.patch
}

build() {
  arch-meson switchboard-plug-elementary-tweaks build
  ninja -C build
}

package() {

  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
