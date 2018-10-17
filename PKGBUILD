# Maintainer: Det
# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=jdk8-docs
_major=8
_minor=192
_build=b12
_hash=750e1c8617c5452694857ad95c3ee230
pkgver=${_major}u${_minor}
pkgrel=2
pkgdesc="Documentation for Oracle Java $_major Development Kit"
arch=('any')
url="http://www.oracle.com/technetwork/java/javase/downloads/index.html"
license=('custom:Oracle')
depends=("java-environment>=$_major")
options=('!strip')
source=("http://download.oracle.com/otn-pub/java/jdk/${pkgver}-${_build}/${_hash}/jdk-${pkgver}-docs-all.zip"
        "http://download.oracle.com/otn-pub/java/javafx/${_major}.0.${_minor}-b10/${_hash}/javafx-${pkgver}-apidocs.zip"
        'LICENSE-Documentation.txt'
        'LICENSE-Oracle-Legal-Notices.txt')
md5sums=('6ffc6a5ff3e01acae17b5b1e99059399'
         '43e7c48ceb1096d612413e94ef695b45'
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
