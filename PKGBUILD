# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sebastian Bøe <sebastianbooe at gmail dot com>

pkgname=firrtl
pkgver=1.3.2
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
sha512sums=('82c614a3e59f5ac5cd280683a1a471e1e48f7b0fbf03c0e06327344f6f33a6ba7216191558cf6cbd957f8694dbc826d82a4f2dd27fcb617f2799941ea714c40c'
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
