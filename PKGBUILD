# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Veeti Paananen <veeti.paananen@rojekti.fi>
# Contributor: fresh24 <pascher.christian@gmail.com>

pkgbase=gtk-theme-elementary-bzr
pkgname=('gtk-theme-elementary-bzr' 'plank-theme-pantheon-bzr')
pkgver=r447
pkgrel=1
arch=('any')
url='https://launchpad.net/egtk'
license=('GPL3')
groups=('pantheon-unstable')
makedepends=('bzr')
source=('gtk-theme-elementary::bzr+lp:egtk')
sha256sums=('SKIP')

pkgver() {
  cd gtk-theme-elementary

  echo "r$(bzr revno)"
}

package_gtk-theme-elementary-bzr() {
  pkgdesc='elementary GTK theme'
  depends=('gtk-engine-murrine' 'gtk-engine-unico')
  optdepends=('elementary-icon-theme')
  provides=('gtk-theme-elementary')
  conflicts=('gtk-theme-elementary')

  cd gtk-theme-elementary

  mkdir -p "${pkgdir}"/usr/share/themes/elementary
  cp -dr --no-preserve='ownership' gtk-2.0 gtk-3.0 metacity-1 index.theme "${pkgdir}"/usr/share/themes/elementary/

# Fix permissions
  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod 644 {} +
}

package_plank-theme-pantheon-bzr() {
  pkgdesc='Pantheon Plank theme'
  depends=('plank')
  provides=('plank-theme-pantheon')
  conflicts=('plank-theme-pantheon')

  cd gtk-theme-elementary

  install -dm 755 "${pkgdir}"/usr/share/plank/themes/Pantheon
  install -m 644 plank/dock.theme "${pkgdir}"/usr/share/plank/themes/Pantheon/
}

# vim: ts=2 sw=2 et:
