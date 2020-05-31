# Maintainer: Ngô͘ Io̍k-ūi <wusyong9104@gmail.com>

pkgname=rime-taigi
pkgver=0.0.0.20200531
_commit=c05c9acb683a3ba1ccb34d722bcd4ccb2895f4d9
pkgrel=1
pkgdesc="Taiwanese input for rime"
arch=('x86_64')
url="https://github.com/i3thuan5/rime-taigi"
license=('LGPL')
# dependency for reverse lookup
makedepends=('librime' 'rime-prelude' 'rime-essay')
source=("https://github.com/i3thuan5/rime-taigi/archive/$_commit/rime-taigi-$_commit.tar.gz")
md5sums=('f7082e16860bbccb17fa34dbf08bf872')

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
}
