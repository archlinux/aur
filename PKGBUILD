caps_pkgname=DHCProbe
_pkgname=dhcprobe
pkgname=$_pkgname-git
pkgver=r15.bb96b07
pkgrel=1
pkgdesc='Retrieve configuration from a DHCP server'
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
  cd "$srcdir/$caps_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$caps_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$caps_pkgname"
  make DESTDIR="$pkgdir/" install
}
