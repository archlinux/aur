#Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=yle-dl
pkgver=2.7.2
pkgrel=1
_gitid=e9b547b
pkgdesc="Download video and audio from YLE Areena."
arch=("any")
url="http://aajanki.github.io/yle-dl/"
license=("GPL2")
depends=('python2-crypto' 'php')
optdepends=('python2-youtube-dl: new lightweight backend'
            'rtmpdump: old rtmpdump backend')
conflicts=('rtmpdump-yle')
replaces=('rtmpdump-yle')
_adobehdsversion=2015.04.25
source=("yle-dl-${pkgver}.tar.gz::https://github.com/aajanki/yle-dl/tarball/${pkgver}"
        "AdobeHDS-${_adobehdsversion}.php::https://raw.githubusercontent.com/K-S-V/Scripts/9c1afcc4b452cb9bf75f8653495c80180e2bf086/AdobeHDS.php")
md5sums=('c5ed8912b9dd0aa9e3bcb0fa17f5344a'
         'a7dcf3b7d3c6330bbe7b1df1ee99caa1')

prepare() {
  cd "${srcdir}/aajanki-${pkgname}-${_gitid}"

  sed 's|/usr/local|/usr|' -i yle-dl
  sed "s|'php'|'php', '-d extension=bcmath.so', '-d extension=curl.so'|" -i yle-dl
}

package() {
  cd "${srcdir}/aajanki-${pkgname}-${_gitid}"

  make prefix=/usr DESTDIR="${pkgdir}" install

  install -D -m644 "${srcdir}/AdobeHDS-${_adobehdsversion}.php" "${pkgdir}/usr/share/yle-dl/AdobeHDS.php"
}
