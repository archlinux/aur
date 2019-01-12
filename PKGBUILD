# Maintainer: absrdspc <repom2[at]airmail[dot]cc>

pkgname=phgen-git
pkgver=r28.a93816e0
pkgrel=1
pkgdesc="Pattern-based random phrase generation using WordNet (git version)"
arch=('x86_64' 'i686')
url="https://github.com/AbsurdlySuspicious/PhraseGen"
license=('Apache')
depends=('jre8-openjdk-headless')
makedepends=('sbt' 'git')
#optdepends=()
provides=('phgen')
conflicts=('phgen')

source=("git+https://github.com/AbsurdlySuspicious/PhraseGen.git")
md5sums=('SKIP')

_gitname=phgen

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$srcdir/$_gitname"
  sbt assembly
}

package() {
  install -Dm755 -t "$pkgdir/usr/bin" 'phgen'
  install -Dm644 -t "$pkgdir/usr/share/java/phgen" "$srcdir/$_gitname/target/scala-2.12/phgen.jar"
}

