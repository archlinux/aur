# Maintainer: vn158 <vn158 at seznam dot cz>

pkgname=jucy
pkgver=0.87.1
pkgrel=2
pkgdesc='Jucy is a client for the DirectConnect protocol.'
arch=('i686' 'x86_64')
url='https://web.archive.org/web/20210516161142/http://www.jucy.eu/'
license=('BSD')
groups=()
depends=('java-runtime')
makedepends=('imagemagick')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')

source=(jucy.linux.gtk.x86_64.zip::${url}download.php?filename=jucy.linux.gtk.x86_64.zip ${pkgname}.desktop ${pkgname}.sh)
noextract=()

md5sums=('6819fe2b6122eefbb54c0a88bb430712'
         '059c1f5e917db6d62d610467562ae641'
         '718e2ef6e7cd5f5aef5d939cc0325076')
sha1sums=('21a2fe798b119db2aaec9b4463c46b327969ef27'
          'e137d39eefe9070f21630de450908ac9c791553c'
          '61d44329ebc2d7f86a6e345c552f9cb9fdccf59c')

build() {
  for _size in 48 32 24 16 ; do
    convert ${pkgname}/icon.xpm -trim -resize ${_size}x -background transparent -extent ${_size}x${_size} +repage -strip \
    -define png:compression-level=9 ${pkgname}-${_size}.png
  done
}

package() {
  #cd "$startdir"
  install -d -m755 ${pkgdir}/usr/share/${pkgname}
  install -d -m755 ${pkgdir}/usr/bin
#  install -m644 *.jar ${pkgdir}/usr/share/${pkgname}
  cp -rfp ${pkgname} ${pkgdir}/usr/share
  install -m755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  for _size in 48 32 24 16 ; do
    install -m644 -D ${pkgname}-${_size}.png "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png"
  done
  install -m644 -D ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

}

