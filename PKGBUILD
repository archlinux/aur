# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sebastian Bøe <sebastianbooe at gmail dot com>

pkgname=firrtl
pkgver=1.3.0
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
sha512sums=('27b9017e4effc09a46fbde7db1e21cb3555649e11e6d5fe8eb6bf9782e8e4da908d2f801e8d9db903faa6e862901f0dc83eddc7942cfabc50756b02c105bfee2'
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
