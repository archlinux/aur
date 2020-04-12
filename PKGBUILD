pkgname=jtc
pkgver=1.75d
pkgrel=1
pkgdesc="Select JSON elements from input and apply various (e.g. sort, transform, etc) action then output, think it as an alternative to jq"
url=https://github.com/ldn-softdev/jtc
license=(MIT)
source=(git+$url#tag=$pkgver)
b2sums=(SKIP)
arch=(x86_64 i686 aarch64)
makedepends=(git)

build() {
  cd $pkgname
  if [[ $CXX == "g++" || ! -v $CXX ]]; then
    g++ $CXXFLAGS $LDFLAGS -std=gnu++14 -o jtc jtc.cpp
  elif [[ $CXX == "clang++" ]]; then
    $CXX $CXXFLAGS $LDFLAGS -std=c++14 -o jtc jtc.cpp
  else
    $CXX $CXXFLAGS $LDFLAGS -o jtc jtc.cpp
  fi
}

package() {
  cd $pkgname
  install -dm755 "$pkgdir"/usr/{bin,share/{doc,licenses}/$pkgname}
  install -pm755 jtc "$pkgdir"/usr/bin
  install -pm644 {README,'Release Notes','User Guide','Walk-path tutorial'}.md "$pkgdir"/usr/share/doc/$pkgname
  install -pm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}
