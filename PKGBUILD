# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgbase=thue
pkgname=('thue' 'thue-py' 'thue-rb' 'thue-doc')
arch=('x86_64')
pkgver=1.5_2015.0827
pkgrel=2
pkgdesc='Thue programming language'
url='http://catseye.tc/node/Thue.html'
license=('custom:PD')
source=("http://catseye.tc/distfiles/$pkgname-${pkgver/_/-}.zip")
md5sums=('8c987bfe06d3aa255fc2694e82f9faf1')

prepare() {
  2to3 -w -n "$pkgname-${pkgver/_/-}/src/thue.py" >/dev/null 2>&1
}

build() {
  cd "$pkgbase-${pkgver/_/-}/src"
  gcc thue.c -o thue
}

package_thue-doc() {
  arch=('any')
  cd "${pkgname%-doc}-${pkgver/_/-}"
  install -Dm644 doc/license.txt "$pkgdir"/usr/share/licenses/thue/LICENSE
  install -Dm644 doc/thue.txt "$pkgdir"/usr/share/doc/thue/REFERENCE
  install -Dm644 README.markdown "$pkgdir"/usr/share/doc/thue/README.md
  cp -r eg "$pkgdir"/usr/share/doc/thue/examples
}

package_thue() {
  depends=('thue-doc')
  arch=('x86_64')
  cd "$pkgname-${pkgver/_/-}"/src
  install -Dm755 thue "$pkgdir"/usr/bin/thue
}

package_thue-py() {
  depends=('thue-doc' 'python')
  arch=('any')
  cd "${pkgname%-py}-${pkgver/_/-}"
  install -Dm755 src/thue.py "$pkgdir"/usr/bin/thue.py
}

package_thue-rb() {
  depends=('thue-doc' 'ruby')
  arch=('any')
  cd "${pkgname%-rb}-${pkgver/_/-}"
  install -Dm755 src/thue.rb "$pkgdir"/usr/bin/thue.rb
}

