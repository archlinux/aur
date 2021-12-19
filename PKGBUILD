# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: revelation60 <benruyl@gmail.com>
# Contributor: Mark wagie <mark dot wagie at tutanota dot com>

pkgname=gnome-shell-extension-gtile
pkgver=48
pkgrel=1
pkgdesc='A window tiling extension for Gnome'
url='https://github.com/gTile/gTile'
arch=('any')
license=('GPL2+')
depends=('gnome-shell')
makedepends=('bazel' 'yarn')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gTile/gTile/archive/V${pkgver}.tar.gz")
sha256sums=('9f7b7950fbfb3271936e615633701134f634815f970f3d5c504e7b936b22966a')

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
