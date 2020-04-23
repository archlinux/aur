# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sebastian Bøe <sebastianbooe at gmail dot com>

pkgname=firrtl
pkgver=1.2.5
pkgrel=1
pkgdesc='Flexible Intermediate Representation for RTL'
arch=('any')
url='https://github.com/freechipsproject/firrtl'
license=('BSD')
provides=('firrtl')
conflicts=('firrtl')
depends=('java-environment' 'bash')
makedepends=('sbt' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/freechipsproject/firrtl/archive/v$pkgver.tar.gz"
        'firrtl.sh')
sha512sums=('b2055a157445fa4bbf292cc96107e5c48bbd33c239258a762a2020a8c9801dc66e645c1354ee25ebe426b15c1a0fd83b80def8a1cd2aaae6a91164fb138d3080'
            '81a74fab55e360a3b5272a22d5c2dc6005dbf6e865bc2f13b94f5606456807e7f7239e47d17d05e194106f925599f02445accc83c39e92f22f0017002c902c1c')

build(){
  cd firrtl-$pkgver
  sbt assembly
}

package() {
  install -Dm755 firrtl.sh "$pkgdir"/usr/bin/firrtl

  cd firrtl-$pkgver
  install -Dm755 utils/bin/firrtl.jar "$pkgdir"/usr/share/scala/$pkgname/firrtl.jar

  install -Dm644 src/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
