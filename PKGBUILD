# Maintainer: skrewball <jason at joickle dot com>
# Contributor: malacology <guoyizhang at malacology dot net>

pkgname=gnome-shell-extension-blur-my-shell
_pkgbase=blur-my-shell
pkgver=28
pkgrel=2
pkgdesc="Extension that adds a blur look to different parts of the GNOME Shell"
arch=('any')
url="https://github.com/aunetx/blur-my-shell"
license=('GPL3')
depends=('dconf' 'gnome-shell>=1:40')
conflicts=('gnome-shell-extension-blur-my-shell-git')
source=("${_pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ba7fe26e4b5288670b0b6f0c2e0a04dd5de6567b6e861361c1ea4772afa24776')

build() {
  cd "${_pkgbase}-${pkgver}"
  make
}

package() {
  cd "${_pkgbase}-${pkgver}/build"
  local _uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
  
  install -Dm644 -t "${_destdir}" metadata.json *.js *.ui *.css
  install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" schemas/*.xml 
}
