# Maintainer: Jonathon Fernyhough <jonathon+m2x.dev>
# Previous Maintainer : Erik Dubois <erik.dubois@gmail.com>
# Previous Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Diego <cdprincipe@gmail.com>

pkgname=numix-gtk-theme-git
pkgver=2.6.7.r52.15923f7
pkgrel=1
pkgdesc='A flat and light theme with a modern look (GNOME, Openbox, Unity, Xfce)'
arch=('any')
url='https://github.com/numixproject/numix-gtk-theme'
license=('GPL3')
makedepends=('gdk-pixbuf2' 'git' 'glib2' 'sassc')
optdepends=('gtk-engine-murrine: GTK2 theme engine')
conflicts=('numix-gtk-theme')
provides=('numix-gtk-theme')
source=("git+$url.git")
b2sums=('SKIP')

prepare() {
  # `make install` triggers that `all` target, don't need to do that twice
  sed -i '41s@ all@@' numix-gtk-theme/Makefile
}

pkgver() {
  #git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./'

  # 2.6.7 not tagged in master, https://github.com/numixproject/numix-gtk-theme/issues/747
  git -C numix-gtk-theme describe --tags | sed 's/2.6.6/2.6.7/; s/-/.r/; s/-g/./'
}

build() {
  make -C numix-gtk-theme
}

package() {
  make -C numix-gtk-theme DESTDIR="$pkgdir" install
}
