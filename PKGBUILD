# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Chris Warrick <aur@chriswarrick.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
pkgname=pavumeter-gtk3
pkgver=0.9.3
pkgrel=4
pkgdesc="A simple GTK3 volume meter for the PulseAudio sound server"
arch=('x86_64')
url="https://github.com/nekohayo/pavumeter"
# Original project: https://0pointer.de/lennart/projects/pavumeter/
license=('GPL-2.0-only')
depends=(gtkmm3 pulse-native-provider gnome-icon-theme libsigc++)
makedepends=(lynx git)
conflicts=(pavumeter)
provides=(pavumeter)
source=(git+${url}.git
        pavumeter.desktop
        pavumeter-record.desktop)
md5sums=('SKIP'
         'ead0c02a2af5fcf4acc381da39b836df'
         '2d784d472cd22dfc5320c30112e1e59d')

build() {
  cd ${srcdir}/${pkgname%-gtk3}
  ./autogen.sh
  CXXFLAGS="$CXXFLAGS -std=c++11" ./configure --prefix=/usr
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname%-gtk3}
  make DESTDIR=${pkgdir} install

  install -Dm644 ${srcdir}/pavumeter.desktop \
    ${pkgdir}/usr/share/applications/pavumeter.desktop
  install -Dm644 ${srcdir}/pavumeter-record.desktop \
    ${pkgdir}/usr/share/applications/pavumeter-record.desktop
}
