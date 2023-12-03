# Maintainer: plokid <wan_shiwen@outlook.com>
# Maintainer: wuhgit <wuhgit@users.noreply.github.com>

pkgname=rime-custom-pinyin-dictionary
pkgver=20231202
_reponame=CustomPinyinDictionary
pkgrel=1
pkgdesc="rime 自建拼音输入法词库，百万常用词汇量。"
arch=('any')
url="https://github.com/wuhgit/CustomPinyinDictionary"
license=('GFDL' 'CCPL:by-sa')
makedepends=('libime' 'imewlconverter')
source=("https://github.com/wuhgit/${_reponame}/releases/download/assets/CustomPinyinDictionary_Fcitx_${pkgver}.tar.gz")
sha256sums=('da33592c80b8f6cf5fc1a840369afb08e71033d2f94fa9c00f78c6c3790da3d3')

build() {
	libime_pinyindict -d CustomPinyinDictionary_Fcitx.dict temp.txt
	imewlconverter -i:libpy temp.txt -o:rime CustomPinyinDictionary.dict.yaml
}

package() {
	install -Dm644 CustomPinyinDictionary.dict.yaml -t ${pkgdir}/usr/share/rime-data/
}
