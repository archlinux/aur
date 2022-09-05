# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sebastian Bøe <sebastianbooe at gmail dot com>

pkgname=firrtl
pkgver=1.5.2
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
sha512sums=('c248a871fe963995bd9f672f6f597933854d8a57aa8d2968e297a8de496cc74d9f86b8d0ed0ce70c06f554ad8a2a9ef7bce89be9072bc7dbad7e4cb0e7b160a8'
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
