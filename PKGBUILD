# $Id$
# Maintainer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >
# Contributor: Edgard Castro <castro@edgard.org>
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: Tamás Barta < barta dot tamas dot d at gmail dot com >

pkgname=gnome-shell-extension-panel-osd-git
pkgver=1.0.r45.geb0d3c2
pkgrel=1
pkgdesc='Place gnome-shell notifications under the panel instead of above the message-tray. (git version)'
arch=(any)
_githubname=gnome-shell-extension-panel-osd
_githubowner=jenslody
url="https://gitlab.com/${_githubowner}/${_githubname}"
license=(GPL3)
depends=('gnome-shell')
makedepends=("gnome-common" "automake" "autoconf" "intltool" "pkg-config")
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
install='gnome-shell-extension.install'
source=("git+${url}.git")
sha256sums=('SKIP')



pkgver() {
  cd "${srcdir}/${_githubname}"
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_githubname}"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_githubname}"
  make DESTDIR="$pkgdir" install
}
# vim:set ts=2 sw=2 et:
