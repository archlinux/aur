#Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=yle-dl
pkgver=2.14
pkgrel=1
_gitid=440ecb2
pkgdesc="Download video and audio from YLE Areena."
arch=("any")
url="http://aajanki.github.io/yle-dl/"
license=("GPL2")
depends=('python2-crypto' 'python2-youtube-dl')
optdepends=('php-mcrypt: old PHP backend'
            'rtmpdump: old rtmpdump backend')
install=yle-dl.install
_adobehdsversion=2016.05.28
source=("yle-dl"
        "yle-dl-${pkgver}.tar.gz::https://github.com/aajanki/yle-dl/tarball/${pkgver}"
        "AdobeHDS-${_adobehdsversion}.php::https://raw.githubusercontent.com/K-S-V/Scripts/3a9b748f957a921c5f846b3ebc7c99bb8255d2e0/AdobeHDS.php")
md5sums=('1138f597102f6fb4bc43f7dc9a003a3c'
         '7ded00f9b0ef7e08b1fc95609cbd13e4'
         '81751f2c5184f33a539b5e0bdfdf7adc')

prepare() {
  cd "${srcdir}/aajanki-${pkgname}-${_gitid}"

  sed 's|/usr/local|/usr|' -i yle-dl
  sed "s|'php'|'php', '-d extension=bcmath.so', '-d extension=curl.so', '-d extension=mcrypt.so'|" -i yle-dl
}

package() {
  cd "${srcdir}/aajanki-${pkgname}-${_gitid}"

  make prefix=/usr DESTDIR="${pkgdir}" install

  install -D -m644 "${srcdir}/AdobeHDS-${_adobehdsversion}.php" "${pkgdir}/usr/share/yle-dl/AdobeHDS.php"
  install -D -m644 "${srcdir}/aajanki-${pkgname}-${_gitid}/yle-dl" "${pkgdir}/usr/share/yle-dl/yle-dl.py"
  install -D -m755 "${srcdir}/yle-dl" "${pkgdir}/usr/bin/yle-dl"
}
