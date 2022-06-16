# Maintainer: budRich
# Contributor: budRich

pkgname=i3ass-git
pkgver=r467.2736a3f039
pkgrel=1
pkgdesc='A bash-script collection to assist the use of i3-wm.'
arch=('any')
url='https://github.com/budlabs/i3ass'
license=('MIT')
depends=('bash>=4.0.0' 'i3-wm' 'gawk' 'sed')
makedepends=('gawk' 'sed')
optdepends=('rofi' 'xdotool')
conflicts=('i3ass' 'i3-gaps')
source=("${pkgname}::git+$url")
provides=(i3ass)
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir/" PREFIX=/usr
  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
