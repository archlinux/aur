# Maintainer: Mikołaj Baranowski <mikolajb@gmail.com>

pkgname=dbxcli
pkgver=0.1.0
pkgrel=1
pkgdesc='A command line client for Dropbox built using the Go SDK'
license=('Apache')
arch=('x86_64' 'i686')
url='https://github.com/dropbox/dbxcli'
depends=()
makedepends=('go')

source=("https://github.com/dropbox/dbxcli/archive/v0.1.0.zip"
        "import-patch.txt")
md5sums=('97a71c85733d5309bc6dfdbd7f11481e'
         'SKIP')
_gosdk=github.com/dropbox/dropbox-sdk-go-unofficial
_cobra=github.com/spf13/cobra
_ioprogress=github.com/mitchellh/ioprogress

build() {
  msg2 'Compiling...'

  GOPATH="$srcdir" go get -fix -v -x ${_gosdk}/
  GOPATH="$srcdir" go get -fix -v -x ${_cobra}/
  GOPATH="$srcdir" go get -fix -v -x ${_ioprogress}/

  ls
  patch ${pkgname}-${pkgver}/main.go import-patch.txt
  cd ${pkgname}-${pkgver}
  GOPATH="$GOPATH:$srcdir" go build -o ${pkgname}
}

package() {
  msg2 'Installing...'

  install -Dm755 ${pkgname}-${pkgver}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
