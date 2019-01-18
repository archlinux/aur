# Maintainer: absrdspc <repom2[at]airmail[dot]cc>

pkgname=phgen-git
pkgver=r30.17d23f1
pkgrel=1
pkgdesc="Pattern-based random phrase generation using WordNet (git version)"
arch=('any')
url="https://github.com/AbsurdlySuspicious/PhraseGen"
license=('Apache')
depends=('java-runtime>=8' 'bash')
makedepends=('sbt' 'git')
#optdepends=()
provides=('phgen')
conflicts=('phgen')

source=("phgen-bin"
        "git+https://github.com/AbsurdlySuspicious/PhraseGen.git")

sha256sums=('29cecf4462abc2d92cf0153af8892902c8768d582f14c659715b5a0dfba5a6e4'
            'SKIP')

_gitname=PhraseGen

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$srcdir/$_gitname"
  sbt assembly
}

package() {
  install -Dm755 -T "$srcdir/phgen-bin" "$pkgdir/usr/bin/phgen"
  install -Dm644 -t "$pkgdir/usr/share/java/phgen" "$srcdir/$_gitname/target/scala-2.12/phgen.jar"
}

