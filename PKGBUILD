# Maintainer: Ayaka Mikazuki <ayaka@mail.shn.hk>

pkgname=rime-tshet
pkgver=0.0.0.20220316
_commit=74dd1d38bfe4bb1e89667e33abe92e956a84fdce
pkgrel=2
pkgdesc="Tshet-uinh input for rime"
arch=('x86_64')
url="https://github.com/ayaka14732/$pkgname"
license=('CC0')
# dependency for reverse lookup
depends=('rime-luna-pinyin' 'rime-cantonese')
makedepends=('librime')
source=("$url/archive/$_commit/$pkgname-$_commit.tar.gz")

prepare() {
  cd $pkgname-$_commit
  # Link essentials
  for _f in $(pacman -Qql rime-prelude rime-essay | grep -v "/$"); do ln -sf $_f; done
}

build(){
  cd $pkgname-$_commit
  for _s in $(ls *.schema.yaml); do rime_deployer --compile $_s; done
}

package() {
  cd $pkgname-$_commit
  find . -type l -delete
  rm build/*.txt
  install -Dm644 *.yaml -t "$pkgdir"/usr/share/rime-data/
  install -Dm644 build/* -t "$pkgdir"/usr/share/rime-data/build/
  #install -Dm644 opencc/* -t "$pkgdir"/usr/share/rime-data/opencc/
}
sha256sums=('adeba386480c23e93333ef678068fd366092ff2c475cead313c3657d48fff215')
