# Maintainer:  Christopher Reimer <mail at c-reimer dot de>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Carl George < carl at george dot computer >

pkgname=pop-gtk-theme
_basever=5.4.3
_timestamp=1629313952
_commit=489dbc8
# There are no recent releases on Github. So this package follows the official PPA's releases
# http://ppa.launchpad.net/system76/pop/ubuntu/pool/main/p/pop-gtk-theme
#pkgver="${_basever}~${_timestamp}~${_commit}" # Not needed until _basever keeps the same between new releases
pkgver="${_basever}"
pkgrel=1
pkgdesc="System76 Pop GTK+ Theme"
arch=('any')
url='https://github.com/pop-os/gtk-theme'
license=('LGPL2.1' 'CCPL' 'GPL3')
makedepends=('sassc' 'meson')
source=("${pkgname}-${_commit}.tar.gz::https://github.com/pop-os/gtk-theme/archive/${_commit}.tar.gz")
sha512sums=('1e4e3b6a3896b91f068278e5a77d778ace7239a5bd81b7cc667dfe8dc4276abc46fb736aaefbca97a5a3f1cff7540697bbaa3d1125455373e473a0895a144728')

build() {
  cd "gtk-theme-${_commit}"*
  meson --prefix='/usr' build
  ninja -C build
}

package() {
  cd "gtk-theme-${_commit}"*
  DESTDIR="${pkgdir}" ninja -C build install

  # https://github.com/pop-os/gtk-theme/issues/436
  ln -s /usr/share/gnome-shell/theme/Pop-dark "${pkgdir}/usr/share/themes/Pop-dark/gnome-shell"
}

