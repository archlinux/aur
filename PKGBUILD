#Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=yle-dl
pkgver=2.8.1
pkgrel=2
_gitid=778c39b
pkgdesc="Download video and audio from YLE Areena."
arch=("any")
url="http://aajanki.github.io/yle-dl/"
license=("GPL2")
depends=('python2-crypto' 'php-mcrypt')
optdepends=('python2-youtube-dl: new lightweight backend'
            'rtmpdump: old rtmpdump backend')
conflicts=('rtmpdump-yle')
replaces=('rtmpdump-yle')
_adobehdsversion=2015.09.18
source=("yle-dl-${pkgver}.tar.gz::https://github.com/aajanki/yle-dl/tarball/${pkgver}"
        "AdobeHDS-${_adobehdsversion}.php::https://raw.githubusercontent.com/K-S-V/Scripts/f7128c622047b3312e1aa4cfb91cd566d8b76700/AdobeHDS.php")
md5sums=('23a5934c394b040e9548ef1b00350afc'
         'b08a4344f44007ed78df5565c54b8d19')

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
