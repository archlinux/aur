# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-tiling-assistant
_pkgname=Tiling-Assistant
pkgver=32
pkgrel=1
pkgdesc="A GNOME Shell extension to expand GNOME's native 2 column design."
arch=('x86_64')
url="https://github.com/Leleat/Tiling-Assistant"
license=('GPL2')
depends=('gnome-shell>=1:40')
install='INSTALL'
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=("*tiling-assistant@leleat-on-github*")
b2sums=('5bb01df23b70f8918fd2986907b150ad0caa2ea8ca4c30c1b8186fc91396befc060680402d8d17253db1867d3cf3b570d171265f2a79f89493092f3b25f4a948')

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
