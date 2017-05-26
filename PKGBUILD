# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-session-bzr
pkgver=r82
pkgrel=1
pkgdesc='The Pantheon Session Handler'
arch=('any')
url='https://code.launchpad.net/~elementary-os/elementaryos/pantheon-xsession-settings'
license=('GPL3')
groups=('pantheon-unstable')
depends=('cerbere-git' 'dconf' 'gala-git' 'gconf' 'gnome-keyring'
         'gnome-session' 'gnome-user-share' 'pantheon-applications-menu-git'
         'pantheon-dpms-helper-bzr' 'plank' 'wingpanel-git'
         'xdg-user-dirs-gtk')
makedepends=('bzr')
optdepends=('pantheon-default-settings-bzr')
source=('pantheon-session::bzr+lp:~elementary-os/elementaryos/pantheon-xsession-settings')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-session

  echo "r$(bzr revno)"
}

prepare() {
  cd pantheon-session/gnome-session

  sed 's/gnome-settings-daemon;//' -i *
}

package() {
  cd pantheon-session

  mkdir -p "${pkgdir}"/{etc/xdg,usr/share/{gnome-session,pantheon}}
  cp -dr --no-preserve='ownership' applications "${pkgdir}"/usr/share/pantheon/
  cp -dr --no-preserve='ownership' autostart "${pkgdir}"/etc/xdg/
  cp -dr --no-preserve='ownership' gnome-session "${pkgdir}"/usr/share/gnome-session/sessions
  cp -dr --no-preserve='ownership' wayland-sessions "${pkgdir}"/usr/share/
  cp -dr --no-preserve='ownership' xsessions "${pkgdir}"/usr/share/

  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod 644 {} +
}

# vim: ts=2 sw=2 et:
