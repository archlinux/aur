# Maintainer: Howard Cheung <mail@h-cheung.cf>

pkgname=fcitx5-pinyin-moegirl-rime
pkgver=20200526
_reponame=fcitx5-pinyin-moegirl
pkgrel=1
pkgdesc="Fcitx 5 Pinyin Dictionary from moegirl.org for rime"
arch=('any')
url="https://github.com/felixonmars/fcitx5-pinyin-zhwiki"
license=('custom')
#makedepends=('libime' 'opencc' 'pypinyin')
source=("git+https://github.com/outloudvi/fcitx5-pinyin-moegirl"
        "https://github.com/outloudvi/fcitx5-pinyin-moegirl/releases/download/0.1/moegirl.raw"
        )
md5sums=('SKIP'
         '43630a7508ed5af781a1e7dc82d03d98')

prepare() {
  cd $_reponame
  cp ../moegirl.raw ./
}

build() {
  cd $_reponame
  make VERSION=$pkgver moegirl.dict.yaml -o moegirl.raw
}

package() {
  cd $_reponame
  make VERSION=$pkgver DESTDIR="$pkgdir" install_rime_dict -o moegirl.dict.yaml
}
