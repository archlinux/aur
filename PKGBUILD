# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Jozef Riha <jose1711 at gmail dot com>

# TODO: gtk-update-icon-cache only tested on XFCE. What about KDE?

set -u
pkgname='master-pdf-editor'
pkgver='3.4.03'
pkgrel='1'
pkgdesc="a complete solution for creation and editing PDF and XPS files (free for NC use)"
url='http://code-industry.net/pdfeditor.php'
arch=('i686' 'x86_64')
license=('commercial')
depends=('qt4>=4.6' 'bzip2' 'expat' 'fontconfig' 'freetype2' 'gcc-libs' 'glib2' 'glibc' 'graphite' 'harfbuzz' 'libffi' 'libice' 'libpng' 'libsm' 'libutil-linux' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'libxext' 'libxrender' 'openssl' 'pcre' 'zlib')
_verwatch=('https://code-industry.net/free-pdf-editor/' 'master-pdf-editor3-\(3.4.03-1\).*\.rpm' 't')
source=("${pkgname}.desktop")
# .tar.tgz has no structure and only one icon
# .rpm has extra icons and the right structure
# .deb has icons, structure and some packaging hints
source_i686=("http://get.code-industry.net/public/${pkgname}${pkgver: 0:1}-${pkgver}-${pkgrel}.i386.rpm")
source_x86_64=("http://get.code-industry.net/public/${pkgname}${pkgver: 0:1}-${pkgver}-${pkgrel}.x86_64.rpm")
sha256sums=('28ce9b6647a8343e7b89626c9d2aa0c28da8a879077231e4eb9c16a6c5a604a0')
sha256sums_i686=('bbce2fe393d80e863f6b6535cfd39547e35a489bd41ae15e7742731f2f86d28a')
sha256sums_x86_64=('3f41869f9c18c5ec14b7d8d52842c3b19d9675bd510359cf1b8101594658a7c7')
install="${pkgname}.install"
options=('!strip')

package() {
  set -u
  mv opt usr "${pkgdir}"
  install -d "${pkgdir}/usr/bin"
  ln -sf "/opt/${pkgname}-3/masterpdfeditor3" "${pkgdir}/usr/bin/masterpdfeditor3"
  sed -i -e 's:\r::g' "${pkgdir}/opt/${pkgname}-3/license.txt"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "/opt/${pkgname}-3/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  set +u
}
set +u
