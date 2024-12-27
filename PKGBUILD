# Contributor: Myt1 <MYT1 @ QQ.com>

pkgname=fcitx5-pinyin-sougou-dict-git
_pkgname=sougouscel
pkgver=20241227.r0.g8759bf6
pkgrel=1
pkgdesc="Fcitx5-pinyin搜狗官网词库全部词量"
arch=('any')
url="https://pinyin.sogou.com/dict/"
license=('custom')
makedepends=('libime' 'git')
source=(git+https://github.com/maoyaotang12/sougouscel.git)
sha512sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare(){
    cd ${_pkgname}/scel
    chmod +x txt.sh
    ./txt.sh
    rm -r txt.sh
}

build() {
	cp -r "${srcdir}/${_pkgname}/百度个人词库.txt" "${srcdir}/${_pkgname}/scel/百度个人词库.txt"
	cat ${_pkgname}/scel/*.txt > sougouciku.txt
	libime_pinyindict sougouciku.txt sougouciku.dict
}

package() {
	install -Dm644 sougouciku.dict -t $pkgdir/usr/share/fcitx5/pinyin/dictionaries/
}
