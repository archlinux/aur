# Maintainer: DuckSoft <realducksoft at gmail dot com>
pkgname=rime-double-pinyin-zrm-ducksoft
pkgver=0.15
pkgrel=1
pkgdesc='自然码双拼 佛振方案 for Rime (DuckSoft 移植版)'
arch=('x86_64')
provides=('rime-double-pinyin-zrm')
conflicts=('rime-double-pinyin-zrm')
depends=('rime-luna-pinyin')
license=('GPL3')
makedepends=('librime' 'rime-prelude' 'rime-essay' 'rime-luna-pinyin')
source=('double_pinyin_zrm.schema.yaml')
sha512sums=('c4a9bfcd55aa7b6b555de7dbb6d01119d11c15659f6f2764c00ff89e70aac6cc8dae395744cd5464da862ba2310b1c1d1b476f06f7d3112a2acfa66c0c267f7d')

prepare() {
    for _f in $(pacman -Qql rime-prelude rime-essay rime-luna-pinyin | grep -v "/$"); do ln -sf $_f; done
}

build(){
    rime_deployer --compile double_pinyin_zrm.schema.yaml
}

package() {
    install -Dm644 double_pinyin_zrm.schema.yaml -t "$pkgdir"/usr/share/rime-data/
    install -Dm644 build/double_pinyin_zrm.{schema.yaml,prism.bin} -t "$pkgdir"/usr/share/rime-data/build/
}
