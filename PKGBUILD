# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
pkgname=gnome-shell-extension-wintile
_uuid=wintile@nowsci.com
_pkgver=2024.11.22-1
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Windows 10 window tiling for GNOME"
arch=('any')
url="https://nowsci.com/wintile"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=('zip')
source=("wintile-${_pkgver}.tar.gz::https://github.com/fmstrat/wintile/archive/v${_pkgver}.tar.gz")
sha256sums=('9a3e3748b4d96253cfeb75929ded021a35029c2ae9d0608b870c0623f69fc4bf')

build() {
	cd "wintile-${_pkgver}"
	sh build.sh
}

package() {
	cd "wintile-${_pkgver}"
	install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
	bsdtar -xvf dist/G45/${_uuid}.zip -C \
	  "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}" --no-same-owner

  install -Dvm644 dist/G45/build/schemas/org.gnome.shell.extensions.wintile.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
