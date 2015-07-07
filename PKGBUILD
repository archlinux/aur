#Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
#Contributor: Archie <Mymaud@gmail.com>

pkgname=freemind-unstable
pkgver=1.1.0.Beta1
pkgrel=1
pkgdesc="FreeMind is a premier free mind-mapping software written in Java."
depends=('java-runtime' 'desktop-file-utils')
makedepends=('apache-ant' 'java-environment>=7')
arch=('any')
license=('GPL')
install="freemind-unstable.install"
source=("http://download.sourceforge.net/project/freemind/freemind-unstable/${pkgver/.Beta/_Beta}/freemind-src-${pkgver/.Beta/_Beta_}.tar.gz"
        "freemind-unstable"
        "freemind-unstable.png"
        "freemind-unstable.desktop")
url="http://freemind.sourceforge.net/wiki/index.php/Main_Page"
md5sums=('03b15dcebdb1058c28e3fba29326e6d5'
         '8fbc1af8866a6c2bf83e881a8940f733'
         '92e7ccb968dbe04e0c5acb3352c4847e'
         '11d249d6c4443a6fab4740b22c140261')

build() {
  cd "${srcdir}"/freemind
  chmod +x check_for_duplicate_resources.sh
  ant dist post
}

package() {
  install -d "${pkgdir}"/usr/share/java/freemind-unstable
  cp -r "${srcdir}"/bin/* "${pkgdir}"/usr/share/java/freemind-unstable
  chmod 755 "${pkgdir}"/usr/share/java/${pkgname}/dist/freemind.sh 
  install -D -m755 "${srcdir}"/freemind-unstable "${pkgdir}"/usr/bin/freemind-unstable
  install -D -m644 "${srcdir}"/freemind-unstable.png "${pkgdir}"/usr/share/pixmaps/freemind-unstable.png
  install -D -m644 "${srcdir}"/freemind-unstable.desktop "${pkgdir}"/usr/share/applications/freemind-unstable.desktop
}

