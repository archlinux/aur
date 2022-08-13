# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sebastian Bøe <sebastianbooe at gmail dot com>

pkgname=firrtl
pkgver=1.5.1
pkgrel=1
pkgdesc='Flexible Intermediate Representation for RTL'
arch=('any')
url='https://github.com/freechipsproject/firrtl'
license=('Apache')
provides=('firrtl')
conflicts=('firrtl')
depends=('java-environment' 'bash')
makedepends=('mill' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/freechipsproject/firrtl/archive/v$pkgver.tar.gz"
        'firrtl.sh')
sha512sums=('adf9652007734e10d676c2d4ca78c11ea587f2fac7c068002d553c139ea5f841bbe0d9b2be2382a2f93bfba86c1708df572a19505606fe96b951d84acd33edd1'
            '2e3ca5c5771bbbf4cfa1245e5bc6e1b65cc17f521ee62ca79e044d24be3c403f85ad8134734eed66132190c1d02e1295de4a0c7a46fd057d8040f1c8cb1865a2')

build(){
  cd firrtl-$pkgver
  mill -i firrtl[2.13.7].assembly
}

package() {
  install -Dm755 firrtl.sh "$pkgdir"/usr/bin/firrtl

  cd firrtl-$pkgver
  install -Dm755 out/firrtl/2.13.7/assembly.dest/out.jar "$pkgdir"/usr/share/scala/$pkgname/firrtl.jar
}
