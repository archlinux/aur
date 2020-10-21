_pkgname=dhcprobe
pkgname=$_pkgname-git
pkgver=x
pkgrel=1
pkgdesc='Retrieve configuration from a DHCP server without having to apply it'
arch=('any')
url='https://github.com/JohannesBuchner/DHCProbe'
makedepends=('git')
#install=$pkgname.install
source=(
  'git+https://github.com/JohannesBuchner/DHCProbe.git'
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure
  make
  make install  
}

package() {
  cd "$srcdir"
  install -Dm644 "$pkgname" "$pkgdir/usr/bin"
}
