# Contributor: Jean Lucas <jean at 4ray dot co>
# Contributor: John Jenkins <twodopeshaggy at gmail dot com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=ssh-chat-git
pkgver=r387.f36d7eb
pkgrel=1
pkgdesc="Chat over SSH"
arch=('i686' 'x86_64')
url="https://github.com/shazow/ssh-chat"
license=('MIT')
makedepends=('go' 'git')
_gourl="github.com/shazow/ssh-chat"

pkgver() {
  GOPATH=$srcdir go get -d ${_gourl}
  cd $srcdir/src/${_gourl}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  GOPATH=$srcdir go get -fix -v ${_gourl}...
}

package() {
  cd ${srcdir}
  install -Dm 0755 bin/ssh-chat $pkgdir/usr/bin/ssh-chat
  install -Dm 0644 src/${_gourl}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm 0644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

