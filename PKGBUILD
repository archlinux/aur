# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-tiling-assistant
_pkgname=Tiling-Assistant
pkgver=31
pkgrel=1
pkgdesc="A GNOME Shell extension to expand GNOME's native 2 column design."
arch=('x86_64')
url="https://github.com/Leleat/Tiling-Assistant"
license=('GPL2')
depends=('gnome-shell>=1:40')
install='INSTALL'
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=("*tiling-assistant@leleat-on-github*")
b2sums=('9ff3b1b4a978e3b20587009e91900ea4c861fe9d88b5ff14cb1f29f9f1b4f304858e516e656931a6e2108379fc014f6702149374c75e0d3bbbd4b2f18c0ca01b')

build() {
  # cd into repo dir
  cd "${srcdir}/Tiling-Assistant-${pkgver}"

  # package extension to compile settings and translations
  gnome-extensions pack tiling-assistant@leleat-on-github \
    --force \
    --podir="../translations" \
    --extra-source="src"
}

package() {
  # cd into repo dir
  cd "${srcdir}/Tiling-Assistant-${pkgver}"

  # instead of using gnome-extensions to install the extension package
  # unzip to $pkgdir/usr/share/gnome-shell/extensions/ since gnome-extensions
  # installs the extension locally while on Arch it seems like /usr/ is the
  # convention
  _UUID="tiling-assistant@leleat-on-github"
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions"
  unzip ${_UUID}.shell-extension.zip \
    -d "${pkgdir}/usr/share/gnome-shell/extensions/${_UUID}"
}
