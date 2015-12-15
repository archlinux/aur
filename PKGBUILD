#Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=yle-dl
pkgver=2.9.0
pkgrel=0
_gitid=82725ca
pkgdesc="Download video and audio from YLE Areena."
arch=("any")
url="http://aajanki.github.io/yle-dl/"
license=("GPL2")
depends=('python2-crypto' 'php-mcrypt')
optdepends=('python2-youtube-dl: new lightweight backend'
            'rtmpdump: old rtmpdump backend')
conflicts=('rtmpdump-yle')
replaces=('rtmpdump-yle')
_adobehdsversion=2015.11.29
source=("yle-dl-${pkgver}.tar.gz::https://github.com/aajanki/yle-dl/tarball/${pkgver}"
        "AdobeHDS-${_adobehdsversion}.php::https://raw.githubusercontent.com/K-S-V/Scripts/ef9a6acde7ae79d39496e7d784ad20e7227adae7/AdobeHDS.php")
md5sums=('4f6a2b012c13886462cd43105c5ae1c1'
         '4bcaeca03f8ff339eda37f994c3ca9a9')

prepare() {
  cd "${srcdir}/aajanki-${pkgname}-${_gitid}"

  sed 's|/usr/local|/usr|' -i yle-dl
  sed "s|'php'|'php', '-d extension=bcmath.so', '-d extension=curl.so', '-d extension=mcrypt.so'|" -i yle-dl
}

package() {
  cd "${srcdir}/aajanki-${pkgname}-${_gitid}"

  make prefix=/usr DESTDIR="${pkgdir}" install

  install -D -m644 "${srcdir}/AdobeHDS-${_adobehdsversion}.php" "${pkgdir}/usr/share/yle-dl/AdobeHDS.php"
}
