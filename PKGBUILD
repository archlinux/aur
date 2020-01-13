# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: 

_gitname=default-settings
_author=elementary
pkgname=pantheon-default-settings
pkgver=5.1.1
pkgrel=4
pkgdesc="Default settings for Pantheon"
arch=('any')
url="https://github.com/${_author}/${_gitname}"
license=('GPL3')
groups=('pantheon-stable')
depends=('elementary-icon-theme' 'gtk-theme-elementary'
         'elementary-wallpapers' 'ttf-droid' 'ttf-opensans' 'ttf-roboto')
provides=('pantheon-default-settings')
conflicts=('pantheon-default-settings')
provides=("${_gitname}")
conflicts=("${_gitname}-git")
source=("${pkgname}.tar.gz::${url}/archive/${pkgver}.tar.gz"
	'arch-tweaks.patch')
sha256sums=('7f17ef8d1dcdaca0017cf8bcf2160543b8b00ad64456e3ff4c826f627b313790'
	    '99528c7ed672a5231f4d42d90421cef18d416f2b7aea6e0381db7cea6f9391d3')

prepare() {
  cd pantheon-default-settings

  patch -Np1 -i ../arch-tweaks.patch
}

package() {
  cd pantheon-default-settings

  install -Dm 644 debian/elementary-default-settings.gsettings-override "${pkgdir}"/usr/share/glib-2.0/schemas/25_pantheon-default-settings.gschema.override
  install -Dm 644 settings.ini -t "${pkgdir}"/etc/gtk-3.0/
  install -dm 755 "${pkgdir}"/etc/skel/.config
  cp -dr --no-preserve='ownership' plank "${pkgdir}"/etc/skel/.config/
  cp -dr --no-preserve='ownership' profile.d sudoers.d "${pkgdir}"/etc/
}


