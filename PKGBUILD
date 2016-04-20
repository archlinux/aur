# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

# Based on numix-themes-git
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Diego <cdprincipe@gmail.com>

pkgname=numix-themes-darkblue-git
pkgver=2.5.1.r200.a0736e4
pkgrel=1
pkgdesc='A flat and light theme with a modern look (GNOME, Openbox, Unity, Xfce) (Dark Blue Variant)'
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
makedepends=('git' 'glib2' 'ruby-sass')
optdepends=('gtk-engine-murrine: GTK2 theme engine')
provides=('numix-themes-darkblue')
conflicts=('numix-themes-darkblue')
source=('numix-themes::git+https://github.com/shimmerproject/Numix.git'
       'dark_colors.patch')
md5sums=('SKIP'
         'b5e966fada97b870f5cd38d07afb609a')

prepare() {
  cd numix-themes/

  patch -Np1 -i ../dark_colors.patch
  ln -srf gtk-3.0/gtk{-dark,}.css
  ln -srf gtk-3.20/gtk{-dark,}.css
}

pkgver() {
  cd numix-themes

  git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./'
}

build() {
  cd numix-themes

  make
}

package() {
  cd numix-themes

  make INSTALL_DIR="${pkgdir}/usr/share/themes/Numix-DarkBlue" install
}

# vim: ts=2 sw=2 et:
