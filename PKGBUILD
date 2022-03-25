# Maintainer: skrewball <skrewball at joickle dot com>
# Contributor: malacology <GuoyiZhang at tmalacology dot net>

pkgname=gnome-shell-extension-blur-my-shell
_pkgname=blur-my-shell
pkgver=28
pkgrel=2
pkgdesc="Extension that adds a blur look to different parts of the GNOME Shell"
arch=('any')
url="https://github.com/aunetx/blur-my-shell"
license=('GPL3')
depends=('dconf' 'gnome-shell')
source=("https://github.com/aunetx/blur-my-shell/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ba7fe26e4b5288670b0b6f0c2e0a04dd5de6567b6e861361c1ea4772afa24776')

build() {
  cd "${_pkgname}-${pkgver}"
  make
}

package() {
  cd "${_pkgname}-${pkgver}/build"
  local _uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
  # Install extension files
  install -Dm644 -t "${_destdir}" metadata.json *.js *.ui *.css
  # Install GSettings Schemas
  install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" schemas/*.xml 
}
