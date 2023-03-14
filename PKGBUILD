# Maintainer: flaribbit <1149761294@qq.com>
# Maintainer: asukaminato <asukaminato@nyan.eu.org>
pkgname=bakadict-git
pkgdesc=离线的命令行日语词典
_name=bakadict
pkgver=r21.3bb4f08
pkgrel=1
source=('git+https://github.com/flaribbit/bakadict.git#branch=master'
        .install)
arch=('any')
url='https://github.com/flaribbit/bakadict'
md5sums=('SKIP'
         'e6a7496670b5280d9bcd5bcf595849dd')
license=('unknown')
install=.install
makedepends=('git' 'cargo' 'rust')
provides=('dict')
pkgver(){
  cd $srcdir/$_name
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build(){
  cd $srcdir/$_name
  cargo build --release
}
package(){
  pushd $srcdir/$_name
  install -Dm755 target/release/dict $pkgdir/usr/bin/dict
  popd
}
