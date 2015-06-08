# Contributor : chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'


pkgname=megacmd
pkgver=0.012
pkgrel=1
pkgdesc="A command-line client for mega.co.nz storage service"
arch=('x86_64' 'i686')
url="https://github.com/t3rm1n4l/$pkgname/"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=()
install="$pkgname.install"
sha256sums=()
_gitroot="git://github.com/t3rm1n4l/megacmd.git"
_gitname=megacmd
_gitrev=e4c1c963c7d96d55190a74a12d25de05f5aa3033


build() {
  cd "$srcdir"
  mkdir -p "$srcdir/go"
  export GOPATH="$srcdir/go"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."
  cd "$srcdir/$_gitname"
  git reset --hard "$_gitrev"
  make
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

