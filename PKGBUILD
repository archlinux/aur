# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-tiling-assistant
_pkgname=Tiling-Assistant
pkgver=39
pkgrel=2
pkgdesc="A GNOME Shell extension to expand GNOME's native 2 column design."
arch=('any')
url="https://github.com/Leleat/Tiling-Assistant"
license=('GPL2')
depends=('gnome-shell')
install='INSTALL'
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=("*tiling-assistant@leleat-on-github*")
b2sums=('e00acb4747b3b1711ee04f2a87342cb453e35ffc1355efc308a22fdaa0db8a1b13b85a8d33bd68e7ae1d86db115f700c6969469ecf3d6935d6bf0b4622b67323')
_uuid=tiling-assistant@leleat-on-github

build() {
  cd "${srcdir}/Tiling-Assistant-${pkgver}"

  gnome-extensions pack "${_uuid}" \
    --force \
    --podir="../translations" \
    --extra-source="src" \
    --extra-source="media"
}

package() {
  cd "${srcdir}/Tiling-Assistant-${pkgver}"

  # instead of using gnome-extensions to install the extension package
  # unzip to $pkgdir/usr/share/gnome-shell/extensions/ since gnome-extensions
  # installs the extension locally while on Arch it seems like /usr/ is the
  # convention
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions"
  unzip ${_uuid}.shell-extension.zip \
    -d "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
}
