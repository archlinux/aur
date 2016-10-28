# Maintainer: Jean Lucas <jean at 4ray dot co>
# Contributor: John Jenkins <twodopeshaggy at gmail dot com>

pkgname=ssh-chat-git
pkgver=r366.7781d5b
pkgrel=1
pkgdesc="Chat over SSH"
arch=('i686' 'x86_64')
url="https://github.com/shazow/ssh-chat"
_gourl="github.com/shazow/ssh-chat"
license=('MIT')
makedepends=('go' 'git')

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
  install -Dm 0755 bin/examples $pkgdir/usr/bin/examples
  install -Dm 0644 src/${_gourl}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm 0644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
