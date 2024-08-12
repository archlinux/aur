# Maintainer: 9pfs <9pfs at amcforum dot wiki>
# Contributor: Jean Lucas <jean at 4ray dot co>
# Contributor: John Jenkins <twodopeshaggy at gmail dot com>
# Contributor: aksr <aksr at t-com dot me>
pkgname=ssh-chat-git
pkgver=r583.daf4677
pkgrel=1
pkgdesc="Chat over SSH"
arch=('i686' 'x86_64')
url="https://github.com/shazow/ssh-chat"
license=('MIT')
makedepends=('go' 'git')
provides=("ssh-chat=$pkgver")
conflicts=('ssh-chat')
source=("git+https://github.com/shazow/ssh-chat.git")
sha256sums=('SKIP')


export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

pkgver() {
  cd "ssh-chat"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "ssh-chat"
  make build
}

package() {
  cd "ssh-chat"
  install -Dm 0755 ssh-chat $pkgdir/usr/bin/ssh-chat
  install -Dm 0644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm 0644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

