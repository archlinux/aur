# Maintainer: DuckSoft <realducksoft at gmail dot com>
pkgname=rime-double-pinyin-flypy-ducksoft
pkgver=0.17
pkgrel=2
pkgdesc='小鹤双拼 佛振方案 for Rime (DuckSoft 移植版)'
arch=('x86_64')
provides=('rime-double-pinyin-flypy')
conflicts=('rime-double-pinyin-flypy')
depends=('rime-stroke' 'rime-luna-pinyin')
license=('GPL3')
makedepends=('librime' 'rime-prelude' 'rime-essay' 'rime-stroke' 'rime-luna-pinyin')
source=('double_pinyin_flypy.schema.yaml')
sha512sums=('19c7f7ede3b08991d97cc4f064657f02a54b09db1089dd07f7f7e24a212f51db2eb9ff7b9322e48c981526489ac83d7f9061696b4cbb2e89a450e694cd7efadb')

prepare() {
    for _f in $(pacman -Qql rime-prelude rime-essay rime-stroke rime-luna-pinyin | grep -v "/$"); do ln -sf $_f; done
}

build(){
    rime_deployer --compile double_pinyin_flypy.schema.yaml
}

package() {
    install -Dm644 double_pinyin_flypy.schema.yaml -t "$pkgdir"/usr/share/rime-data/
    install -Dm644 build/double_pinyin_flypy.{schema.yaml,prism.bin} -t "$pkgdir"/usr/share/rime-data/build/
}
