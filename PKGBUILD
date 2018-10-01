# Maintainer: Gabriel Felipe Huwe <gabrielhuwe@gmail.com>

pkgname=adapta-gtk-theme-legacy-git
pkgver=3.94
pkgrel=2
pkgdesc='An adaptive Gtk+ theme based on Material Design Guidelines 
(Legacy version)'
arch=('any')
url='https://github.com/Jacalz/adapta-gtk-theme-legacy'
license=('GPL2')
depends=('gtk-engine-murrine' 'gtk3')
makedepends=('git' 'gnome-shell' 'inkscape' 'libxml2' 'parallel' 
'sassc')
optdepends=('gnome-shell: The GNOME Shell'
            'gnome-flashback: The GNOME flashback shell'
            'budgie-desktop: The Budgie desktop'
            'cinnamon: The Cinnamon desktop'
            'xfdesktop: The Xfce desktop')
provides=('adapta-gtk-theme')
conflicts=('adapta-gtk-theme' 'adapta-gtk-theme-git')
source=('git+https://github.com/Jacalz/adapta-gtk-theme-legacy.git')
sha256sums=('SKIP')

pkgver() {
  cd adapta-gtk-theme-legacy

  git describe --tags | sed 's/-/.r/; s/-g/./'
}

build() {
  cd adapta-gtk-theme-legacy

  #bundle install --path .
  #export PATH="$(find $PWD/ruby -maxdepth 2 -type d -name bin):$PATH"

  ./autogen.sh \
    --prefix='/usr' \
    --enable-parallel \
    --enable-chrome \
    --enable-telegram \
    --disable-unity
  make
}

package() {
  cd adapta-gtk-theme-legacy

  make DESTDIR="${pkgdir}" install
}
