# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-session-git
pkgver=r101.8bd5b3c
pkgrel=1
pkgdesc='Session settings for Pantheon'
arch=('any')
url='https://github.com/elementary/session-settings'
license=('GPL3')
groups=('pantheon-unstable')
depends=('cerbere-git' 'dconf' 'gala-git' 'gconf' 'gnome-keyring'
         'gnome-session' 'gnome-user-share' 'pantheon-applications-menu-git'
         'pantheon-dpms-helper-git' 'plank' 'wingpanel-git'
         'xdg-user-dirs-gtk')
makedepends=('git')
optdepends=('pantheon-default-settings-git')
source=('pantheon-session::git+https://github.com/elementary/session-settings.git')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-session

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
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
