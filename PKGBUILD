# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sebastian Bøe <sebastianbooe at gmail dot com>

pkgname=firrtl
pkgver=1.4.3
pkgrel=1
pkgdesc='Flexible Intermediate Representation for RTL'
arch=('any')
url='https://github.com/freechipsproject/firrtl'
license=('Apache')
provides=('firrtl')
conflicts=('firrtl')
depends=('java-environment' 'bash')
makedepends=('sbt' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/freechipsproject/firrtl/archive/v$pkgver.tar.gz"
        'firrtl.sh')
sha512sums=('686b3ef282914a1c7fadc11901f2cd193778ab17e2b7f82e7cc94af4beabd9b13d3c387bdfb9bfb12af933cbc457caed0f06240e238d47cfb9fe44e1bacd7cf2'
            '2e3ca5c5771bbbf4cfa1245e5bc6e1b65cc17f521ee62ca79e044d24be3c403f85ad8134734eed66132190c1d02e1295de4a0c7a46fd057d8040f1c8cb1865a2')

build(){
  cd firrtl-$pkgver
  sbt assembly
}

package() {
  install -Dm755 firrtl.sh "$pkgdir"/usr/bin/firrtl

  cd firrtl-$pkgver
  install -Dm755 utils/bin/firrtl.jar "$pkgdir"/usr/share/scala/$pkgname/firrtl.jar
}
