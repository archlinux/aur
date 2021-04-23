# Maintainer: Ewout van Mansom <ewout at vanmansom dot name>
# Contributor: Amin Vakil <info at aminvakil dot com>
# Contributor: XZS <d dot f dot fischer at web dot de>
# Contributor: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Janne Haapsaari <haaja@iki.fi>
# Contributor: Christopher Krooß <didi2002 at web.de>

_srcname=dash-to-dock
pkgname=gnome-shell-extension-dash-to-dock-gnome40-git
_pkgname=dash-to-dock
pkgver=69+434+ga0b2ae2
pkgrel=1
pkgdesc="Move the dash out of the overview transforming it in a dock (with GNOME 40 patches)"
arch=('any')
url="https://micheleg.github.io/dash-to-dock/"
_giturl="git+https://github.com/ewlsh/dash-to-dock/"
license=('GPL')
depends=('gnome-shell')
makedepends=('intltool' 'gettext' 'git')
conflicts=('gnome-shell-extension-dash-to-dock')
provides=('gnome-shell-extension-dash-to-dock')
source=("git+https://github.com/ewlsh/${_srcname}.git#branch=ewlsh/gnome-40")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/${_pkgname}
  git describe --tags | sed 's/^extensions\.gnome\.org-v//g' | sed 's/-/+/g' | sed 's/^56/69/g'
}

build() {
  cd "${srcdir}"/${_pkgname}
  make
}

package() {
  cd "${srcdir}"/${_pkgname}
  make DESTDIR=${pkgdir} VERSION="${pkgver}" install
}
