pkgname="fathom-git"
pkgrel=1
pkgver="v1.2.1.r43.gb278944"
pkgdesc="Fathom - simple website analytics (Community Edition)"
url="https://github.com/usefathom/fathom"
license=("MIT")
arch=("any")
provides=("fathom")
conflicts=("fathom")

makedepends=("git" "go-pie" "npm")

source=("git+https://github.com/usefathom/fathom.git")
md5sums=("SKIP")
_gitname="fathom"

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  mkdir -p gopath/src/github.com/usefathom
  ln -rTsf "$_gitname" gopath/src/github.com/usefathom/fathom
  export GOPATH="$srcdir"/gopath
}

build(){
  export GOPATH="$srcdir"/gopath
  cd "$srcdir"/"$_gitname"
  make build
}

package(){
  cd "$srcdir"/"$_gitname"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE 
  install -Dm755 fathom "$pkgdir"/usr/bin/fathom
}