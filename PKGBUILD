# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: revelation60 <benruyl@gmail.com>
# Contributor: Mark wagie <mark dot wagie at tutanota dot com>

pkgname=gnome-shell-extension-gtile
pkgver=51
pkgrel=1
pkgdesc='A window tiling extension for Gnome'
url='https://github.com/gTile/gTile'
arch=('any')
license=('GPL2+')
depends=('gnome-shell')
makedepends=('bazel' 'python' 'yarn')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gTile/gTile/archive/V${pkgver}.tar.gz")
sha256sums=('7e3b3c40e182f6a090069245ba43c6a324b5342585e4efec15d09f54a8422f3d')

build() {
  cd gTile-${pkgver}
  bazel build :install-extension
}

package() {
  cd gTile-${pkgver}

  install -d "${pkgdir}/usr/share/gnome-shell/extensions/gTile@vibou"
  bsdtar -xvf bazel-bin/install-extension.runfiles/gtile/dist.tar.gz -C \
    "${pkgdir}/usr/share/gnome-shell/extensions/gTile@vibou"

  install -d "${pkgdir}/usr/share/glib-2.0/schemas"
  ln -s /usr/share/gnome-shell/extensions/gTile@vibou/schemas/org.gnome.shell.extensions.gtile.gschema.xml \
    "${pkgdir}/usr/share/glib-2.0/schemas"
}

# vim: ts=2 sw=2 et:
