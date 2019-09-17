# Maintainer: Patrick Schratz <patrick.schratz@gmail.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Geoffroy Carrier <gcarrier@aur.archlinux.org>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=impressive
pkgver=0.12.1
pkgrel=1
pkgdesc='A fancy PDF presentation program (previously known as KeyJNote)'
arch=('any')
url='http://impressive.sourceforge.net'
license=('GPL2')
depends=('python2-pygame' 'python2-opengl' 'python2-pillow' 'ghostscript' 'pdftk-bin')
optdepends=('xdg-utils: for starting web or e-mail hyperlinks from PDF documents'
            'mplayer: for sound and video playback')
source=(http://downloads.sourceforge.net/${pkgname}/Impressive-${pkgver}.tar.gz)
sha256sums=('74a331f41e39a363b362dcadf861e3a300351d5ad5cfe033b5d47215c886f1e4')

prepare() {
  cd "${srcdir}"/Impressive-${pkgver}

# python2 fix
#   for file in $(find . -name '*.py' -print); do
#       sed -i 's_#!.*/usr/bin/python_#!/usr/bin/python2_' $file
#       sed -i 's_#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
#   done
}

package() {
  cd "${srcdir}"/Impressive-${pkgver}

  install -d -m755 "${pkgdir}"/usr/{bin,share/{doc/${pkgname},man/man1}}
  install -m755 ${pkgname}.py "${pkgdir}"/usr/bin/$pkgname
  install -m644 ${pkgname}.html demo.pdf changelog.txt "${pkgdir}"/usr/share/doc/$pkgname/
  install -m644 ${pkgname}.1 "${pkgdir}"/usr/share/man/man1/
}
