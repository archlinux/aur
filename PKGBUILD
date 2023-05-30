# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: revelation60 <benruyl@gmail.com>
# Contributor: Mark wagie <mark dot wagie at tutanota dot com>

pkgname=gnome-shell-extension-gtile
pkgver=52
pkgrel=1
pkgdesc='A window tiling extension for Gnome'
url='https://github.com/gTile/gTile'
arch=('any')
license=('GPL-2.0-or-later')
depends=('gnome-shell')
makedepends=('bazel' 'git' 'python' 'yarn')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gTile/gTile/archive/V${pkgver}.tar.gz")
sha256sums=('9082df9c870beda12712a50fee407fcd2f1bfb4768254050662c020216c208c7')

build() {
  cd gTile-${pkgver}
  echo 6.2.0 > .bazelversion
  bazel build :install-extension
}

package() {
  cd gTile-${pkgver}

  install -d "${pkgdir}/usr/share/gnome-shell/extensions/gTile@vibou"
  bsdtar -xvf bazel-bin/install-extension.runfiles/_main/dist.tar.gz -C \
    "${pkgdir}/usr/share/gnome-shell/extensions/gTile@vibou"

  install -d "${pkgdir}/usr/share/glib-2.0/schemas"
  ln -s /usr/share/gnome-shell/extensions/gTile@vibou/schemas/org.gnome.shell.extensions.gtile.gschema.xml \
    "${pkgdir}/usr/share/glib-2.0/schemas"
}

# vim: ts=2 sw=2 et:
