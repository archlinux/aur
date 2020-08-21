# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=rime-liangfen
pkgver=0.0.0.20200821
_commit=a67ea69d45c2785048ad05b1639d9f01ad5a01f0
pkgrel=1
pkgdesc="unapproved fork of LiangFen by Sim CheonHyeong"
arch=('any')
url="https://github.com/szc126/rime-liangfen"
license=('custom')
# dependency for reverse lookup
depends=('rime-prelude')
makedepends=('librime')
source=("https://github.com/szc126/rime-liangfen/archive/$_commit/rime-liangfen-$_commit.tar.gz")
sha512sums=('6590ada15b096fdcd6d02bffe1fe46112dbaa873388130d86d08914ede53f59487b4fc77ed10f55b559c79e50141d41dad6c1f4b42831d04e46c363082e568fa')

prepare() {
  cd $pkgname-$_commit
  # Link essentials
  for _f in $(pacman -Qql rime-prelude | grep -v "/$"); do ln -sf $_f; done
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
  
  #install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/
}
