# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Diego Principe <cdprincipe@at@gmail@dot@com>

pkgname=thunderbird-theme-adwaita
pkgver=31.0
pkgrel=2
pkgdesc="Adwaita theme for Thunderbird (Matches the default Gnome Shell theme)"
url="https://addons.mozilla.org/en-US/thunderbird/addon/adwaita-thunderbird"
arch=('any')
license=('MPL')
depends=("thunderbird")
makedepends=('unzip')
_git_commit="0284aedcc3c6ca908e1083647ab4589c2bbd84be"
source=("${pkgname}-${pkgver}.zip"::"https://github.com/gnome-integration-team/thunderbird-gnome/archive/${_git_commit}.zip")
sha256sums=('a9ccbd1e07cbfff094db1eee2fa93522aada77048323fa2082c0e25c6a7f94ca')

package() {
  cd "${srcdir}/thunderbird-gnome-${_git_commit}/theme"
  # Find extension UUID
  _emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
  # Prepare destination folder
  _dstdir="${pkgdir}/usr/lib/thunderbird/extensions/${_emid}"
  install -d "${_dstdir}"
  # Copy files
  cp -R * "${_dstdir}"
  # Restore standard permissions
  find "${pkgdir}" -type d -print0 | xargs --null chmod 0755
  find "${pkgdir}" -type f -print0 | xargs --null chmod 0644
}


