pkgname=reilysiegel-bear-git
pkgver=r2.0bc6ce2
pkgrel=1
pkgdesc='A simple utility for easy sleep'
arch=('x86_64')
url="https://github.com/ReilySiegel/bear"
license=('EPL')
makedepends=('clojure' 'native-image-jdk11-bin' 'git')
source=("$pkgname::git+https://github.com/ReilySiegel/bear.git#branch=master")
md5sums=("SKIP")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  export GRAALVM_HOME="/usr/lib/jvm/java-11-graalvm"
  clojure -A:native-image
}

package() {
  cd "$pkgname"
  install -Dm755 bear "$pkgdir"/usr/bin/bear
}