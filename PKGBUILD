pkgname=rime-project-trans-bin
pkgver=20231115
source=(
	dict.yml::"https://github.com/project-trans/rime-dict/releases/latest/download/project_trans.dict.yaml"
	dict_pinyin.yml::"https://github.com/project-trans/rime-dict/releases/latest/download/project_trans_pinyin.dict.yaml"
	)
license=(unknown)
arch=('any')
makedepends=("jq" "curl")
pkgrel=1
url="https://github.com/project-trans/rime-dict"
pkgdesc="跨儿计划 RIME 词典"
md5sums=('f89cf661ff06d8aeba07b4c3df28af58'
         'f7b14ed817772fbe4750497408a5ff71')
provides=("rime-project-trans")
conflicts=(rime-project-trans-git)

function pkgver() {
	_rawVersion=$(curl -s "https://api.github.com/repos/project-trans/rime-dict/releases/latest" -L | jq .tag_name)
	echo ${_rawVersion} | cut -c 11-$(expr ${#_rawVersion} - 1)
}

function package(){
	install -Dm644 "${srcdir}/dict.yml" "${pkgdir}/usr/share/rime-data/project_trans.dict.yaml"
	install -Dm644 "${srcdir}/dict_pinyin.yml" "${pkgdir}/usr/share/rime-data/project_trans_pinyin.dict.yaml"
}
