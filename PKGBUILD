# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=sshesame-git
pkgver=r23.b74f93f
pkgrel=1
pkgdesc="A fake SSH server that lets everyone in and logs their activity"
arch=('x86_64')
url='https://github.com/jaksi/sshesame'
license=('Apache2')
makedepends=('go')
source=("git+https://github.com/jaksi/sshesame")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/sshesame"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/sshesame"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go get -d -v ./...
  go build -v -o sshesame-bin
}

package() {
  cd "${srcdir}/sshesame"
  install -Dm755 sshesame-bin "${pkgdir}/usr/bin/sshesame"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/sshesame/LICENSE"
}