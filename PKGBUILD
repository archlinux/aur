# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=fcitx5-pinyin-zhwiki-rime
_reponame=fcitx5-pinyin-zhwiki-rime
pkgver=20200620
_converterver=0.2.1
pkgrel=1
pkgdesc="Fcitx 5 Pinyin Dictionary from zh.wikipedia.org for rime"
arch=('any')
url="https://github.com/felixonmars/fcitx5-pinyin-zhwiki"
license=('GFDL' 'CCPL:by-sa')
makedepends=('libime' 'opencc' 'pypinyin')
source=("https://github.com/felixonmars/fcitx5-pinyin-zhwiki/archive/$_converterver/$pkgname-$_converterver.tar.gz"
        https://dumps.wikimedia.org/zhwiki/$pkgver/zhwiki-$pkgver-all-titles-in-ns0.gz)
md5sums=('2d01f45a73b7c686fef5c44472a9572b'
         '850f75a5a3a80a4dd58c83c715d80500')

prepare() {
  cd ${_reponame}-$_converterver
  cp ../zhwiki-$pkgver-all-titles-in-ns0.gz ./
}

build() {
  cd ${_reponame}-$_converterver
  make VERSION=$pkgver zhwiki.dict.yaml
}

package() {
  cd ${_reponame}-$_converterver
  make VERSION=$pkgver DESTDIR="$pkgdir" install_rime_dict
}
