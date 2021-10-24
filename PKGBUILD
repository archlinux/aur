# Maintainer: so1ar <so1ar114514@gmail.com>
# Maintainer: fkxxyz <fkxxyz@163.com>

pkgname=rime-solarpinyin
pkgver=1.1.4.20211024
pkgrel=1
pkgdesc="Simplified pinyin input for rime"
arch=('x86_64')
url="https://github.com/so1ar/rime-cloverpinyin"
license=('LGPL')
depends=('rime-prelude' 'rime-emoji')
makedepends=('librime')
provides=('rime-cloverpinyin' 'rime-symbols')
conflicts=('rime-cloverpinyin' 'rime-symbols')
source=(https://github.com/so1ar/rime-cloverpinyin/releases/download/${pkgver}/clover.schema-${pkgver}.zip)
sha256sums=('62dac51d71eb5711c50db0883530f8edafd240dcabbae336710c8b453ede7cf2')

build(){
  cd $srcdir
  rime_deployer --compile clover.schema.yaml . /usr/share/rime-data
}

package() {
  cd $srcdir
  rm build/*.txt
  rm -rf opencc/emoji*
  install -Dm644 *.yaml -t "$pkgdir"/usr/share/rime-data/
  install -Dm644 build/* -t "$pkgdir"/usr/share/rime-data/build/
  install -Dm644 opencc/* -t "$pkgdir"/usr/share/rime-data/opencc
}
