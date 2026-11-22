# Maintainer: vn158 <vn158 at seznam dot cz>

pkgname=jucy
pkgver=0.87.1
pkgrel=3
pkgdesc='A client for the DirectConnect protocol.'
arch=('i686' 'x86_64')
url='https://web.archive.org/web/20210516161142/http://www.jucy.eu/'
license=('BSD-2-Clause')
groups=()
depends=('gtk2' 'jre8-openjdk')
makedepends=('imagemagick')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip' '!debug')

source_i686=(jucy.linux.gtk.x86.zip::${url}download.php?filename=jucy.linux.gtk.x86.zip ${pkgname}.desktop ${pkgname}.sh)
source_x86_64=(jucy.linux.gtk.x86_64.zip::${url}download.php?filename=jucy.linux.gtk.x86_64.zip ${pkgname}.desktop ${pkgname}.sh)

noextract=()

sha256sums_i686=('fd78f19c17a178793750c2d4422c3af3630528dde28ed9f061f79bf80911d32a'
                   'aab0ea76378d67459a26d73f2b1501152ab357908e03e651192c2f932b787020'
                   '92358309ed0616103d5d23230b0d6ac0248c5fc9e04ceb4d23e50183ff32e741')
sha256sums_x86_64=('7fbab47c9f8cfecdf2392dfe70ebf1b92bc3ae11676a13b4cc2bde2e72d35c76'
                   'aab0ea76378d67459a26d73f2b1501152ab357908e03e651192c2f932b787020'
                   '92358309ed0616103d5d23230b0d6ac0248c5fc9e04ceb4d23e50183ff32e741')

build() {
  for _size in 48 32 24 16 ; do
    magick ${pkgname}/icon.xpm -trim -resize ${_size}x -background transparent -extent ${_size}x${_size} +repage -strip \
    -define png:compression-level=9 ${pkgname}-${_size}.png
  done
}

package() {
  install -d -m755 ${pkgdir}/usr/share/${pkgname}
  install -d -m755 ${pkgdir}/usr/bin
  cp -rfp ${pkgname} ${pkgdir}/usr/share
  install -m755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  for _size in 48 32 24 16 ; do
    install -m644 -D ${pkgname}-${_size}.png "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png"
  done
  install -m644 -D ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

}
