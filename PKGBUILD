# Maintainer: so1ar <so1ar114514@gmail.com>
# Maintainer: fkxxyz <fkxxyz@163.com>

pkgname=rime-solarpinyin
pkgver=1.2.0.20220909
pkgrel=1
pkgdesc="Simplified pinyin input for rime"
arch=('x86_64')
url="https://github.com/so1ar/rime-cloverpinyin"
license=('LGPL')
depends=('rime-prelude' 'rime-emoji' 'rime-symbols-git')
makedepends=('librime')
provides=('rime-cloverpinyin')
conflicts=('rime-cloverpinyin')
source=(https://github.com/so1ar/rime-cloverpinyin/releases/download/${pkgver}/clover.schema-${pkgver}.zip)
sha256sums=('e6e9a3289ff4008ec5af84f20693aeb09db83a31c1f4d3533d5a26ea4e28acaf')

build(){
  cd $srcdir
  rime_deployer --compile clover.schema.yaml . /usr/share/rime-data
}

package() {
  cd $srcdir
  rm build/*.txt
  rm -rf opencc/symbol*
  rm -rf opencc/emoji*
  install -Dm644 *.yaml -t "$pkgdir"/usr/share/rime-data/
  install -Dm644 build/* -t "$pkgdir"/usr/share/rime-data/build/
  install -Dm644 opencc/* -t "$pkgdir"/usr/share/rime-data/opencc
}
