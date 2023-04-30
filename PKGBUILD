# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: James Thomas <notrevolution at gmail dot com>

pkgname=epubcheck
pkgver=5.0.1
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
sha512sums=('70a9b5c31ce035a5343f4ae67a1fe891b6ef27bc54c5b3f03c6fdf2e01898c56459b6cee4b99c1820965cc8d9f1f857619f854816bef34fc8462bdbdc5e48ca8'
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
