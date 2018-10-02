# Maintainer: Gabriel Felipe Huwe <gabrielhuwe@gmail.com>

pkgname=adapta-gtk-theme-legacy-git
pkgver=3.94.0.149.r1.9abbb7ef
pkgrel=1
pkgdesc='An adaptive Gtk+ theme based on Material Design Guidelines 
(Legacy version)'
arch=('any')
url='https://github.com/ghuwe/adapta-gtk-theme-legacy'
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
source=('git+https://github.com/ghuwe/adapta-gtk-theme-legacy.git')
sha256sums=('SKIP')

pkgver() {
  cd adapta-gtk-theme-legacy

  git describe --tags | sed 's/-/.r/; s/-g/./'
}

build() {
  cd adapta-gtk-theme-legacy
 
  ./autogen.sh \
    --prefix='/usr' \
    --enable-parallel \
    --enable-chrome \
    --enable-plank \
    --enable-telegram \
    --disable-unity
  make
}

package() {
  cd adapta-gtk-theme-legacy

  make DESTDIR="${pkgdir}" install
  install -dm 755 "${pkgdir}"/usr/share/plank/themes
  ln -s /usr/share/themes/Adapta/plank "${pkgdir}"/usr/share/plank/themes/Adapta
}
