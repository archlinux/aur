# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: jorge_barroso <jorge.barroso.11@gmail.com>
# Contributor: Yonathan Dossow <ydossow@archlinux.cl>
pkgname=389-console
pkgver=1.1.19
pkgrel=1
pkgdesc="A Java based remote management console used for managing 389 Administration Server and 389 Directory Server."
arch=('any')
url="http://port389.org"
license=('GPL')
depends=('which' 'bash' 'idm-console-framework' 'java-environment')
makedepends=('apache-ant')
source=("https://releases.pagure.org/389-console/${pkgname}-${pkgver}.tar.bz2"
        'commons.patch')
sha256sums=('974ede78f3023b8292ed9599cafdae878b811bdc6dfa6e1a201f43391d1a979b'
            '710426750971db777d9dc1cfcb0b0f9ba3136409dbff9c4bd8da54c722780c39')

prepare() {
  cd ${pkgname}-${pkgver}
  patch < ../commons.patch
}

build() {
  cd ${pkgname}-${pkgver}
  ant -Dbuilt.dir="built" \
    -Djss.local.location=/usr/share/java \
    -Dapache.codec.local.location=/usr/share/java/commons-codec \
    -Dapache.lang.local.location=/usr/share/java/commons-lang
}

package() {
  cd ${pkgname}-${pkgver}
  
  install -Dm755 built/389-console "${pkgdir}/usr/bin/389-console"
  install -Dm644 built/389-console_en.jar "${pkgdir}/usr/share/java/389-console_en.jar"
  install -Dm644 389-console.8 "${pkgdir}/usr/share/man/man8/389-console.8"
}

# vim:set ts=2 sw=2 et:
