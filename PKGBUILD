# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgbase=pantheon-default-settings-git
pkgname=('pantheon-default-settings-git')
pkgver=5.0.r22.g605590b
pkgrel=1
arch=('any')
url='https://github.com/elementary/default-settings'
license=('GPL')
groups=('pantheon-unstable')
makedepends=('git')
source=('pantheon-default-settings::git+https://github.com/elementary/default-settings.git')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-default-settings

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  pkgdesc='Default settings for Pantheon'
  depends=('elementary-icon-theme-git' 'gtk-theme-elementary-git'
           'elementary-wallpapers-git' 'ttf-droid' 'ttf-opensans')
  provides=('pantheon-default-settings')
  conflicts=('pantheon-default-settings')

  cd pantheon-default-settings

  install -Dm 644 overrides/default-settings.gschema.override "${pkgdir}"/usr/share/glib-2.0/schemas/25_pantheon-default-settings.gschema.override
  install -Dm 644 settings.ini -t "${pkgdir}"/etc/gtk-3.0/
  install -dm 755 "${pkgdir}"/etc/skel/.config
  cp -dr --no-preserve='ownership' plank "${pkgdir}"/etc/skel/.config/
  cp -dr --no-preserve='ownership' profile.d "${pkgdir}"/etc/
}

# vim: ts=2 sw=2 et:
