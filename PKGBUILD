# Maintainer: bagel jr aryanagarwal897 at Gmail dot com
# Contributor: Amin Vakil <info at aminvakil dot com>
# Contributor: XZS <d dot f dot fischer at web dot de>
# Contributor: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Janne Haapsaari <haaja@iki.fi>
# Contributor: Christopher Krooß <didi2002 at web.de>

_srcname=dash-to-dock
pkgname=gnome-shell-extension-dash-to-dock-gnome41-git
pkgver=69+526+gcd5d7c4
pkgrel=2
pkgdesc="move the dash out of the overview transforming it in a dock (With GNOME 41 patches)"
arch=('any')
url="https://github.com/frantisekz/dash-to-dock/"
_giturl="git+https://github.com/frantisekz/dash-to-dock/"
license=('GPL')
depends=('gnome-shell')
makedepends=('git' 'sassc')
conflicts=('gnome-shell-extension-dash-to-dock')
provides=('gnome-shell-extension-dash-to-dock')
source=("git+https://github.com/frantisekz/${_srcname}.git#branch=fzatlouk/gnome-41")
sha256sums=('SKIP')

pkgver() {
  cd "${_srcname}"
  git describe --tags | sed 's/^extensions\.gnome\.org-v//g' | sed 's/-/+/g' | sed 's/^56/69/g'
}

build() {
  export SASS=sassc
  cd "${_srcname}"
  make VERSION="$pkgver" _build
}

package() {
  cd "${_srcname}"
  make
  make DESTDIR=${pkgdir} install
}
