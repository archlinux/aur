# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
_extname=jiggle
_uuid=jiggle-dev@jeffchannell.com
pkgname=gnome-shell-extension-jiggle
pkgver=8+r38+g436d1cf
pkgrel=2
pkgdesc='Gnome extension that highlights the cursor position when the mouse is moved rapidly.'
arch=('any')
url='https://github.com/jeffchannell/jiggle'
license=('GPL3')
groups=('gnome-shell-extensions')
depends=('gnome-shell>=1:43')
makedepends=('git' 'glib2' 'unzip')
_commit=436d1cf6f10e76ff27ce4775e8ebe666dc9d60c3  # master^0
source=("git+${url}.git#commit=${_commit}")
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_extname}"
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
  cd "${srcdir}/${_extname}"
  glib-compile-schemas schemas/
  make build
}

check() {
  cd "${srcdir}/${_extname}"
  make test
}

package() {
  cd "${srcdir}/${_extname}"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  unzip jiggle_latest.zip -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  chown root:root -R "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
}
