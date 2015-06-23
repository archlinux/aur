# Maintainer: John Jenkins twodopeshaggy@gmail.com

pkgname=ssh-chat-git
epoch=1
pkgver=0.288.6c893a8
pkgrel=1
pkgdesc="A command line tool for chating over SSH"
arch=('i686' 'x86_64')
url="https://github.com/shazow/ssh-chat"
license=('MIT')
makedepends=('go' 'git')
source=(
  'git+git://github.com/shazow/ssh-chat.git'
)

sha256sums=(
  'SKIP'
)
_gitname="ssh-chat"

pkgver() {
  cd "${srcdir}/${_gitname}"
  echo "0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}


prepare(){
mkdir -p "$srcdir/go"
export GOPATH="$srcdir/go"
go get golang.org/x/crypto/ssh
go get code.google.com/p/gopass
go get github.com/alexcesaro/log
go get github.com/alexcesaro/log/golog
go get github.com/jessevdk/go-flags
go get github.com/shazow/ssh-chat
go get github.com/shazow/ssh-chat/chat
go get github.com/shazow/ssh-chat/chat/message
go get github.com/shazow/ssh-chat/sshd


}

build() {
  cd "${srcdir}/${_gitname}"
  make build
}

package() {
  cd "${srcdir}/${_gitname}"
  install -D ssh-chat "${pkgdir}/usr/bin/ssh-chat"
}
