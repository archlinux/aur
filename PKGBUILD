# Maintainer:  Christopher Reimer <mail at c-reimer dot de>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Carl George < carl at george dot computer >

pkgname=pop-gtk-theme
pkgver=5.4.4
pkgrel=1
pkgdesc="System76 Pop GTK+ Theme"
arch=('any')
url='https://github.com/pop-os/gtk-theme'
license=('LGPL2.1' 'CCPL' 'GPL3')
makedepends=('sassc' 'meson')
source=("https://github.com/pop-os/gtk-theme/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('98aee760f11da91a8a3e2900070ee591b5150e542e967fad17419947607a325b26132b14a25b472f2124d0ad5ef56050de8030e6f1a80cbd8f1361df32fbd64f')

build() {
  cd "gtk-theme-${pkgver}"
  meson --prefix='/usr' build
  ninja -C build
}

package() {
  cd "gtk-theme-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install

  # https://github.com/pop-os/gtk-theme/issues/436
  ln -s /usr/share/gnome-shell/theme/Pop-dark "${pkgdir}/usr/share/themes/Pop-dark/gnome-shell"
}

