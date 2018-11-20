# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Urs Wolfer <uwolfer @ fwo.ch>

pkgname='qtemu'
pkgver='1.0.5'
pkgrel='11'
pkgdesc='Graphical user interface for QEMU written in Qt4'
arch=('i686' 'x86_64')
url='https://qtemu.org'
license=('GPL')
depends=('qemu' 'qt4')
makedepends=('cmake')
source=(
  "https://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
  "qtemu.desktop::https://sourceforge.net/p/qtemu/code/HEAD/tree/trunk/qtemu/misc/qtemu.desktop?format=raw"
)
sha256sums=('752942fae239996c826580fd0b32986cf96a92a0982710f726947ddf791dc921'
            '7ba7589034c166a7717f83ef7b6bd7dce079032f9ce4ac4d0d0514022685c9eb')

build() {
  cd "${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX='/opt/qtemu' .
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -d "${pkgdir}/usr/bin"
  ln -s '/opt/qtemu/bin/qtemu' -t "${pkgdir}/usr/bin/"
  install -Dpm0644 "${srcdir}/qtemu.desktop" -t "${pkgdir}/usr/share/applications/"
  install -Dpm0644 'images/crystal/new.png' "${pkgdir}/usr/share/icons/qtemu.png"
}
