# Maintainer: Det
# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=jdk8-docs
_major=8
_minor=172
_build=b11
_hash=a58eab1ec242421181065cdc37240b08
pkgver=${_major}u${_minor}
pkgrel=1
pkgdesc="Documentation for Oracle Java $_major Development Kit"
arch=('any')
url="http://www.oracle.com/technetwork/java/javase/downloads/index.html"
license=('custom:Oracle')
depends=("java-environment>=$_major")
options=('!strip')
source=("http://download.oracle.com/otn-pub/java/jdk/${pkgver}-${_build}/${_hash}/jdk-${pkgver}-docs-all.zip"
        "http://download.oracle.com/otn-pub/java/javafx/${_major}.0.${_minor}-${_build}/${_hash}/javafx-${pkgver}-apidocs.zip"
        'LICENSE-Documentation.txt'
        'LICENSE-Oracle-Legal-Notices.txt')
md5sums=('c96e3ead11b81d489bfaf6a6d6622bc6'
         '94dfcffa4d561f47622046d52dda775f'
         '4d54057ca75b691366977dab2277e869'
         '3137397f4dba13f4a79157819af583a3')

DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -b oraclelicense=a -o %o %u')

package() {  
  # Create Dirs
  install -d "$pkgdir"/usr/share/doc/java$_major/javafx/

  # Install
  mv docs/* "$pkgdir"/usr/share/doc/java$_major/
  mv api "$pkgdir"/usr/share/doc/java$_major/javafx/

  # License
  install -Dm644 LICENSE-Oracle-Legal-Notices.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
