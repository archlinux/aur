# Maintainer: aksr <aksr at t-com dot me>
pkgname=wmii-git
pkgver=r2820.489c9e47
pkgrel=1
epoch=
pkgdesc="A dynamic window manager for X11."
arch=('i686' 'x86_64')
url="https://github.com/0intro/wmii"
license=('MIT')
categories=()
groups=()
depends=('libx11' 'libxinerama' 'libxrandr')
makedepends=('git')
optdepends=(
  'dash: for use of the default wmiirc configs'
  'libxft: for anti-aliased font support'
  'xorg-xmessage: for use of the default wmiirc configs'
  'plan9port: for use of the alternative plan9port wmiirc'
  'python2: for use of the alternative Python wmiirc'
  'ruby-rumai: for use of the alternative Ruby wmiirc'
)
checkdepends=()
provides=()
conflicts=("${pkgname%-*}" "${pkgname%-*}-hg")
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+$url")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
  install -Dm644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
  rm $pkgdir/usr/share/doc/wmii/LICENSE
}

