# Maintainer: Victor <v1c70rp@gmail.com>
# Contributor: Patrick Schratz <patrick.schratz@gmail.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Geoffroy Carrier <gcarrier@aur.archlinux.org>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=impressive
_rev=310
pkgver=0.13.0_r$_rev
pkgrel=1
pkgdesc='A simple presentation program that displays slideshows of PDF, image or video files'
arch=('any')
url='http://impressive.sourceforge.net'
license=('GPL2')
depends=('python-pygame' 'python-opengl' 'python-pillow' 'mupdf-tools')
makedepends=('subversion')
optdepends=('pdftk: for retrieving PDF metadata, can replace mupdf-tools'
            'ghostscript: for alternate PDF rendering'
            'xdg-utils: for starting web or e-mail hyperlinks from PDF documents'
            'mplayer: for sound and video playback'
            'ffmpeg: for more efficient generation of video preview images')
source=("${pkgname}::svn+https://svn.emphy.de/impressive/trunk/impressive#revision=$_rev")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  make ${pkgname}.py man
}

package() {
  cd "${srcdir}/${pkgname}"

  install -d -m755 "${pkgdir}"/usr/{bin,share/man/man1}
  install -m755 ${pkgname}.py "${pkgdir}"/usr/bin/$pkgname
  install -m644 ${pkgname}.1 "${pkgdir}"/usr/share/man/man1/
}
