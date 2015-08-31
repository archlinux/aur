## Originals
# Maintainer: Charon77 <evans.jahja@yahoo.com>
# Contributor: debdj <debd92@gmail.com>

# GTK2 fork:
# GI Jack < iamjacksemail@hackermail.com>

pkgname=florence05
_pkgname=florence
pkgver=0.5.4
pkgrel=2
pkgdesc="A configurable on-screen virtual keyboard(GTK2 version)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/florence/"
license=('GPL')
depends=('gtk2' 'gconf>=2.0' 'libglade>=2.0' 'libxml2' 'librsvg' 'cairo' 'gettext' 'libxtst')
makedepends=('intltool>=0.23' 'gstreamer>=0.10')
optdepends=('gnome-doc-utils' 'libnotify' 'libpanelapplet')
provides=('florence')
conflicts=('florence')
source=("http://nchc.dl.sourceforge.net/project/florence/florence/0.5.4-gtk2/florence-$pkgver.tar.bz2" "florence_config.desktop")
sha256sums=('26d33aa20d5fbf34ceeded4c41cb922d2988b6082e33d9acc46dd7bfe56d31a1'
            '501ae59aa37c0a3bf6f724d34b04a821984afc825e49760eac713e9cc5fd9bc9')
build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  
  ./configure --prefix=/usr --without-panelapplet --without-docs --without-notification --disable-schemas-compile
  #you might want to add --without-at-spi if you don't have at-spi, or simply install at-spi.
  
  make || return 1
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install || return 1

  #add a menu entry for configuring florence
  install -Dm 644 ${startdir}/florence_config.desktop ${pkgdir}/usr/share/applications/florence_config.desktop

}

