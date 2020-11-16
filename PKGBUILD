# Maintainer: Kienyew <aobi100bt@hotmail.com>

pkgname=fcitx5-pinyin-chinese-idiom
pkgver=20200930
pkgrel=3
_commit='0c1b605e7797d7cf509c45fba308cdd25dfe9a26'
pkgdesc="Fcitx 5 Pinyin Chinese Idiom Dictionary"
url='https://github.com/Kienyew/fcitx5-pinyin-chinese-idiom'
arch=('any')
license=('MIT')
makedepends=('libime' 'pypinyin')
source=(
  "https://github.com/Kienyew/$pkgname/releases/download/v1.0/$pkgname-v1.0.tgz"
  'https://raw.githubusercontent.com/pwxcoo/chinese-xinhua/master/data/idiom.json'
)
md5sums=(
  '6ce28a54da860336a81cf80552e892fb'
  'SKIP'
)

build() {
  python3 "$srcdir/$pkgname-v1.0/convert.py" "$srcdir/idiom.json" > idioms.raw
  libime_pinyindict idioms.raw idioms.dict
}

package() {
  install -Dm644 idioms.dict "$pkgdir/usr/share/fcitx5/pinyin/dictionaries/idioms.dict"
  install -Dm644 "$srcdir/$pkgname-v1.0/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
