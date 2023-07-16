# Maintainer: Daniel Poellmann <aur@<lastname><firstname>.de>
# Contributor: tuxayo < victor (replace by @) tuxayo DOT net >
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: fnord0 < fnord0 AT riseup DOT net >
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: tuxayo < victor (replace by @) tuxayo DOT net >

pkgname=webgoat
pkgver=2023.4
pkgrel=1
pkgdesc='Deliberately insecure J2EE web application designed to teach web application security concepts'
arch=('i686' 'x86_64')
url='https://github.com/WebGoat/WebGoat'
license=('GPL2')
depends=('java-runtime')
makedepends=('maven' 'git')
optdepends=('webscarab: proxy for analyzing applications that communicate using the HTTP and HTTPS protocols, used to help solve most WebGoat lessons'
            'paros: MitM HTTP/HTTPS proxy, spider, XSS and injection scanner + more, used to help solve WebGoat lessons')
source=("$pkgname-$pkgver.tar.gz::https://github.com/WebGoat/WebGoat/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e3d86067a59b4afe57bfea613a4984c2664a4365c26326afc35166d2db4aff8b')

prepare() {
    echo ""
}

build() {
  cd "$srcdir/WebGoat-$pkgver"
  # mvn clean
  mvn package

  echo "#!/bin/bash" > webgoat
  echo "java -Dfile.encoding=UTF-8 -Dwebgoat.port=8080 -Dwebwolf.port=9090 -jar /opt/webgoat/webgoat-$pkgver.jar" >> webgoat
}

package() {
  cd "$srcdir/WebGoat-$pkgver"
  install -Dm755 "target/webgoat-$pkgver.jar" "$pkgdir/opt/webgoat/webgoat-$pkgver.jar"
  install -Dm755 webgoat "$pkgdir/usr/bin/webgoat"
}
