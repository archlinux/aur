# Maintainer: Nbiba bedis <bedisnbiba@gmail.com>
# Credits: based on adapta-gtk-theme-git aur package

pkgname=plata-gtk-theme-git
pkgver=0.4.7.1
pkgrel=1
pkgdesc='An adaptive Gtk+ theme based on Material Design Guidelines'
arch=('any')
url='https://gitlab.com/tista500/plata-theme'
license=('GPL2')
depends=('gtk-engine-murrine' 'gtk3')
makedepends=('git' 'gnome-shell' 'inkscape' 'libxml2' 'parallel' 'sassc')
optdepends=('gnome-shell: The GNOME Shell'
            'gnome-flashback: The GNOME flashback shell'
            'budgie-desktop: The Budgie desktop'
            'cinnamon: The Cinnamon desktop'
            'xfdesktop: The Xfce desktop')
provides=('plata-gtk-theme')
conflicts=('plata-gtk-theme')
source=('git+https://gitlab.com/tista500/plata-theme.git')
md5sums=('SKIP')

pkgver() {
  cd plata-theme

  git describe --tags | sed 's/-/.r/; s/-g/./'
}

build() {
  cd plata-theme

  #bundle install --path .
  #export PATH="$(find $PWD/ruby -maxdepth 2 -type d -name bin):$PATH"

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
  cd plata-theme

  make DESTDIR="${pkgdir}" install

  install -dm 755 "${pkgdir}"/usr/share/plank/themes
  ln -s /usr/share/themes/Plata/plank "${pkgdir}"/usr/share/plank/themes/Plata
}
