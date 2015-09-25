# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Jozef Riha <jose1711 at gmail dot com>

# TODO: gtk-update-icon-cache only tested on XFCE. What about KDE?

set -u
pkgname='master-pdf-editor'
pkgver='3.4.10'
pkgrel='1'
pkgdesc="a complete solution for creation and editing PDF and XPS files (free for NC use)"
arch=('i686' 'x86_64')
url='http://code-industry.net/pdfeditor.php'
license=('commercial')
depends=('qt4>=4.6' 'bzip2' 'expat' 'fontconfig' 'freetype2' 'gcc-libs' 'glib2' 'glibc' 'graphite' 'harfbuzz' 'libffi' 'libice' 'libpng' 'libsm' 'libutil-linux' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'libxext' 'libxrender' 'openssl' 'pcre' 'zlib')
options=('!strip')
install="${pkgname}.install"
_verwatch=('https://code-industry.net/free-pdf-editor/' 'master-pdf-editor-\([0-9\.]\+\).*\.tar\.gz' 't')
source=("${pkgname}.desktop")
# .tar.tgz has no structure and only one icon
# .rpm has extra icons and the right structure
# .deb has icons, structure and some packaging hints
source_i686=("http://get.code-industry.net/public/${pkgname}${pkgver: 0:1}-${pkgver}-${pkgrel}.i386.rpm")
source_x86_64=("http://get.code-industry.net/public/${pkgname}${pkgver: 0:1}-${pkgver}-${pkgrel}.x86_64.rpm")
sha256sums=('28ce9b6647a8343e7b89626c9d2aa0c28da8a879077231e4eb9c16a6c5a604a0')
sha256sums_i686=('0a8887cef64e03b684d4a183d387e60a0f65a4a1c7a827b42419f42da23dc4b5')
sha256sums_x86_64=('ffee1043d1b631c8e979f53ecbdfdd3179041e6a5766d137cc4081a4d16f7355')

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
