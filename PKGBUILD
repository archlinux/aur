# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=asm-cli
pkgver=1.0.1
pkgrel=1
pkgdesc="Interactive shell of assembly language(X86/X64) based on unicorn and keystone "
arch=('x86_64')
url='https://github.com/cch123/asm-cli'
license=('MIT')
makedepends=('go' 'unicorn' 'keystone')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('859bfc5e06425148faac9810d41deab2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go get -d -v ./...
  go build -v -o "${srcdir}/asm-cli-bin"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ../asm-cli-bin "${pkgdir}/usr/bin/asm-cli"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/asm-cli/LICENSE"
  go clean -modcache #Remove go libraries
}