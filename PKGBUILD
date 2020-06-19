# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx5-pinyin-zhwiki-rime
pkgver=20200601
_converterver=0.2.1
pkgrel=1
pkgdesc="Fcitx 5 Pinyin Dictionary from zh.wikipedia.org for rime"
arch=('any')
url="https://github.com/felixonmars/fcitx5-pinyin-zhwiki"
license=('GFDL' 'CCPL:by-sa')
makedepends=('opencc' 'pypinyin')
optdepends=(
  'libime: must choose one to build'
  'libime-git: must choose one to build'
)
conflicts=('rime-pinyin-zhwiki')
source=("https://github.com/felixonmars/fcitx5-pinyin-zhwiki/archive/$_converterver/$pkgname-$_converterver.tar.gz"
        https://dumps.wikimedia.org/zhwiki/$pkgver/zhwiki-$pkgver-all-titles-in-ns0.gz)
md5sums=('2d01f45a73b7c686fef5c44472a9572b'
         '223f9ddca5e26714ae2777399637aeac')

prepare() {
  mv fcitx5-pinyin-zhwiki-$_converterver $pkgname-$_converterver
  cd $pkgname-$_converterver
  cp ../zhwiki-$pkgver-all-titles-in-ns0.gz ./
}

build() {
  cd $pkgname-$_converterver
  make VERSION=$pkgver zhwiki.dict.yaml
}

package() {
  cd $pkgname-$_converterver
  make VERSION=$pkgver DESTDIR="$pkgdir" install_rime_dict
}
