# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: James Thomas <notrevolution at gmail dot com>

pkgname=epubcheck
pkgver=4.2.2
pkgrel=3
pkgdesc='A tool to validate epub files'
arch=('any')
url="https://github.com/IDPF/$pkgname"
license=('BSD')
depends=('java-environment')
makedepends=('maven')
source=("$pkgname-$pkgver.tar.gz::https://github.com/w3c/epubcheck/archive/v$pkgver.tar.gz"
        'epubcheck'
        'epubcheck.1')
sha512sums=('ba122677c6d0250d4b94d2c280f6613a4673d8fccee9b2919ce9e2cd738f7c2c914e9144f5d5da67c853427b7fd303aedcc3389ca2a5ac0f208b104e01a948cf'
            '04d10c21a57678e996c8da196c880455b21e97cf973c952a14d7b80504aa7ca5dfdd51ad9b9eccdf2de15d5c7e57a76ae698a80ac910fa325722747ce50b0670'
            'adec024c0d9a10aff846a0ece557426e943d2d696e9a1dc1d85859bc6b8bf5569ad39f9fd3832465e9f990a2364dc93d1915778aee2afc746722d5c0112c4d54')

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
