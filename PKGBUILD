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
sha512sums=('37921faf71171cf8df1e39642f0d29b5721832f86fbe9ebcb15d2a2d266a9d57d021646aca910391b437383a8412db4b0272eab2c7ccb9ef263170352d373d11')

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
