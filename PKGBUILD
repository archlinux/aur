# Maintainer: M.Erdem OZGEN <m.erdemozgen@gmail.com>
pkgname='git-switcher'
pkgver='r31.9c6d083'
pkgrel=1
pkgdesc="Git Profile Switcher switch between your git profiles easily" 
arch=('x86_64')
url="https://github.com/TheYkk/git-switcher"
license=('Apache-2.0')
makedepends=('go' 'git')
source=('git+https://github.com/TheYkk/git-switcher')
md5sums=('SKIP')


pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  mkdir -p build
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build  
}



package() {
cd "$pkgname"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ./LICENSE
  
}