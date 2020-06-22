# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: James Thomas <notrevolution at gmail dot com>

pkgname=epubcheck
pkgver=4.2.3
pkgrel=1
pkgdesc='A tool to validate epub files'
arch=('any')
url="https://github.com/w3c/$pkgname"
license=('BSD')
depends=('java-environment')
makedepends=('maven')
source=("$pkgname-$pkgver.tar.gz::https://github.com/w3c/epubcheck/archive/v$pkgver.tar.gz"
        'epubcheck'
        'epubcheck.1')
sha512sums=('a9d67f0d9601c51ba3423bb75906dd5b9ca2868fb070a690fa1c3b3f58c975234663fb71fec5c507a1f29f3ca9bb920141417e3fd86138f92d970433f71ae4cd'
            '04d10c21a57678e996c8da196c880455b21e97cf973c952a14d7b80504aa7ca5dfdd51ad9b9eccdf2de15d5c7e57a76ae698a80ac910fa325722747ce50b0670'
            'eaca0a730f65572e7756599ba01168fa0d07f228fc4b7e950e00eba2372490c6fc898749015800fc56e70be0640c53401f9d40500231d72d83abb5d8cbca99b3')

build() {
  cd "$pkgname-$pkgver"
  mvn clean package -Dmaven.test.skip=true -Dmaven.repo.local="./"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/java/$pkgname/" target/epubcheck.jar
  install -Dm644 -t "$pkgdir/usr/share/java/$pkgname/lib/" target/lib/*.jar
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" *.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
  install -Dm644 -t "$pkgdir/usr/share/man/man1/" "$srcdir/epubcheck.1"
  install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/epubcheck"
}
