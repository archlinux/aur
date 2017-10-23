# Maintainer:  Sky Chan <diufanshu@gmail.com>
# Contributor: Michael Lass <bevan@bi-co.net>
# Contributor: Hector Mtz-Seara <hseara.at.gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Christian Storm <Christian.Storm@gmx.de>

# This is a jabref mirror 

_pkgname=jabref
pkgname=${_pkgname}-mirror
pkgver=4.0
pkgrel=2
pkgdesc="GUI frontend for BibTeX, written in Java, Using aliyun OSS to accelerate the source downloading process"
arch=('any')
url="http://www.jabref.org/"
license=('MIT')
depends=('java-runtime>=8')
conflicts=('jabref')
optdepends=(
   'gsettings-desktop-schemas: For web search support'
)
source=(http://jabref.oss-cn-shenzhen.aliyuncs.com/JabRef-${pkgver}.jar
        jabref.sh
        jabref.desktop)
noextract=(JabRef-${pkgver}.jar)
sha256sums=('5555fd7691600a47e6ced54873738b4bd04dc2ad7f749c66887d343d2ff1dc06'
            'd5d31399586f0d76f0e408620a2d868e5c830708d350385a2281bc2138ecd607'
            'f958793f6e408bab7db84973169b30ed61077112d3f552dbcc9f068847317602')

prepare() {
  cd ${srcdir}
  bsdtar -xf JabRef-${pkgver}.jar images/icons/JabRef-icon-48.png
}

package() {
  cd ${srcdir}
  install -Dm755 JabRef-${pkgver}.jar ${pkgdir}/usr/share/java/${_pkgname}/JabRef-${pkgver}.jar

  install -Dm755 ${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}
  sed -i "s/VERSION/${pkgver}/" ${pkgdir}/usr/bin/${_pkgname}

  install -Dm644 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  install -Dm644 images/icons/JabRef-icon-48.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png
}
