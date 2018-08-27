# Maintainer: Patrick Schratz <patrick.schratz@gmail.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Geoffroy Carrier <gcarrier@aur.archlinux.org>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=impressive
pkgver=0.12.0
pkgrel=2
pkgdesc='A fancy PDF presentation program (previously known as KeyJNote)'
arch=('any')
url='http://impressive.sourceforge.net'
license=('GPL2')
depends=('python2-pygame' 'python2-opengl' 'python2-pillow' 'ghostscript' 'pdftk-bin')
optdepends=('xdg-utils: for starting web or e-mail hyperlinks from PDF documents'
            'mplayer: for sound and video playback')
source=(http://downloads.sourceforge.net/${pkgname}/Impressive-${pkgver}.tar.gz)
sha256sums=('7dc78de333e4a942036ba4bda53358799f493114f2f655b2ab2689b6fdc0587d')

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
