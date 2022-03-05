# Maintainer: so1ar <so1ar114514@gmail.com>
# Maintainer: fkxxyz <fkxxyz@163.com>

pkgname=rime-solarpinyin
pkgver=1.1.4.20220306
pkgrel=2
pkgdesc="Simplified pinyin input for rime"
arch=('x86_64')
url="https://github.com/so1ar/rime-cloverpinyin"
license=('LGPL')
depends=('rime-prelude')
makedepends=('librime')
provides=('rime-cloverpinyin')
conflicts=('rime-cloverpinyin')
source=(https://github.com/so1ar/rime-cloverpinyin/releases/download/${pkgver}/clover.schema-${pkgver}.zip)
sha256sums=('c894116c9b40fc55d401e607e823f375f378645c61e23506cc3226f071926357')

build(){
  cd $srcdir
  rime_deployer --compile clover.schema.yaml . /usr/share/rime-data
}

package() {
  cd $srcdir
  rm build/*.txt
  rm -rf opencc
  install -Dm644 *.yaml -t "$pkgdir"/usr/share/rime-data/
  install -Dm644 build/* -t "$pkgdir"/usr/share/rime-data/build/
  #install -Dm644 opencc/* -t "$pkgdir"/usr/share/rime-data/opencc
}
