# Maintainer: flaribbit <1149761294@qq.com>
# Maintainer: asukaminato <asukaminato@nyan.eu.org>
pkgname=bakadict-git
pkgdesc=离线的命令行日语词典
_name=bakadict
pkgver=r19.1fa4f69
pkgrel=1
source=('git+https://github.com/flaribbit/bakadict.git#branch=master'
        'jp.db::https://github.com/flaribbit/bakadict/releases/download/databases/jp.db')
arch=('any')
url='https://github.com/flaribbit/bakadict'
md5sums=('SKIP'
         '2d3b1ed834c3b36e31eef515400d7160')
license=('unknown')
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
  install -Dm644 jp.db ~/.config/bakadict/databases/jp.db
  pushd $srcdir/$_name
  install -Dm755 target/release/dict $pkgdir/usr/bin/dict
  popd
}
