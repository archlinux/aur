# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: kuno <neokuno AT gmail DOT com>
# Contributor: uncoDMX <uncoDMX AT yahoo DOT com>
# Contributor: zw0rk <ostronom AT gmail DOT com>

pkgname=clojurescript-git
_realname=${pkgname/%-git/}
pkgver=r3297.r2.ge962ec0
pkgrel=1
pkgdesc="Clojure to JS compiler, git version"
arch=('any')
url="https://github.com/clojure/clojurescript"
license=('EPL')
groups=()
depends=('java-runtime')
makedepends=('git' 'unzip' 'curl')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=$pkgname.install
source=(
  "git+https://github.com/clojure/clojurescript.git"  
  'clojurescript.sh')
md5sums=(
  'SKIP' 
  '2265f31dcd3e5dad7ddd59a28b998bfb')

pkgver() {
  cd $srcdir/$_realname
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_realname
  ./script/bootstrap
}


package() {
  mkdir -p $pkgdir/etc/profile.d
  mkdir -p $pkgdir/usr/share/licenses/$_realname
  mkdir -p $pkgdir/opt/$_realname/{bin,lib,script}
  
  cp -r $srcdir/$_realname/{src,script} $pkgdir/opt/$_realname/ || return 1
  # Insta1l libraries
  install -Dm644 $srcdir/$_realname/lib/* $pkgdir/opt/$_realname/lib/ || return 1 
  # Install executables
  install -Dm755 $srcdir/$_realname/bin/* $pkgdir/opt/$_realname/bin/ || return 1
  # Install others
  install -Dm644 $_realname.sh $pkgdir/etc/profile.d || return 1
  install -Dm644 $srcdir/$_realname/epl-v10.html $pkgdir/usr/share/licenses/$_realname/
}
