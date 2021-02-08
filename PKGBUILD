# Maintainer:  Christopher Reimer <mail at c-reimer dot de>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Carl George < carl at george dot computer >

pkgname=pop-gtk-theme
_basever=5.3.3
_timestamp=1611615513
_commit=5ab6f1e
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pop-os/gtk-theme/archive/${_commit}.tar.gz")
sha512sums=('2433fc9d1e354c3cf36a5dfe311819ab6cb9e801a420709b048e51dea1d8e1d95decb5fa5760d51e82a4de2f06b8674e0cb1ab0c5b906b4ef525e03ea40e4b54')

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

