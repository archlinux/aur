# Maintainer: so1ar <so1ar114514@gmail.com>
# Maintainer: fkxxyz <fkxxyz@163.com>

pkgname=rime-solarpinyin
pkgver=1.1.4.20211201
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
sha256sums=('c2fb71d6575db27a127cf20e638ecb98eeec8e5bea9f33bdc6bc90dd3e9a89f6')

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
