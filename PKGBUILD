# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=sshesame-git
pkgver=r23.b74f93f
pkgrel=2
pkgdesc="A fake SSH server that lets everyone in and logs their activity"
arch=('x86_64')
url='https://github.com/jaksi/sshesame'
license=('Apache')
depends=('glibc')
makedepends=('go-pie')
source=("git+https://github.com/jaksi/sshesame")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/sshesame"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/sshesame"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go get -d -v ./...
}

build() {
  cd "${srcdir}/sshesame"
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go build -v -o sshesame-bin
}

package() {
  cd "${srcdir}/sshesame"
  install -Dm755 sshesame-bin "${pkgdir}/usr/bin/sshesame"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}