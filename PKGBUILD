# Maintainer : Yamada Hayao <hayao@fascode.net>
# Contributor: Maxime Gauduin <alucryd@archlinux.org> 
# Contributor: Phillip Schichtel <phillip.public@schich.tel>

pkgname=adapta-gtk-theme-git
pkgver=3.95.0.11.r2.51c02f689
pkgrel=2
pkgdesc='An adaptive Gtk+ theme based on Material Design Guidelines'
arch=('any')
url='https://github.com/adapta-project/adapta-gtk-theme'
license=('GPL2')
depends=('gtk-engine-murrine' 'gtk3')
makedepends=('git' 'gnome-shell' 'inkscape' 'libxml2' 'parallel' 'sassc')
optdepends=('gnome-shell: The GNOME Shell'
            'gnome-flashback: The GNOME flashback shell'
            'budgie-desktop: The Budgie desktop'
            'cinnamon: The Cinnamon desktop'
            'xfdesktop: The Xfce desktop')
provides=('adapta-gtk-theme')
conflicts=('adapta-gtk-theme')
source=('git+https://github.com/adapta-project/adapta-gtk-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd adapta-gtk-theme

  git describe --tags | sed 's/-/.r/; s/-g/./'
}

build() {
  cd adapta-gtk-theme

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
  cd adapta-gtk-theme

  make DESTDIR="${pkgdir}" install

  install -dm 755 "${pkgdir}"/usr/share/plank/themes
  ln -s /usr/share/themes/Adapta/plank "${pkgdir}"/usr/share/plank/themes/Adapta
}

# vim: ts=2 sw=2 et:
