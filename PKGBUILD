# Contributor: Myt1 <MYT1 @ QQ.com>

pkgname=fcitx5-pinyin-sougou-dict
pkgver=20240930.r0.ga18ec3a
pkgrel=1
pkgdesc="Fcitx5-pinyin搜狗官网词库全部词量"
arch=('any')
url="https://pinyin.sogou.com/dict/"
license=('custom')
makedepends=('libime' 'git')
source=(git+https://github.com/maoyaotang12/sougouscel.git)
sha512sums=('SKIP')

pkgver() {
    cd sougouscel
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cat sougouscel/*.txt >sougouciku.txt
	libime_pinyindict sougouciku.txt sougouciku.dict
}

package() {
	install -Dm644 sougouciku.dict -t $pkgdir/usr/share/fcitx5/pinyin/dictionaries/
}
