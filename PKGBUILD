# Maintainer :       Oleksandr Miliukhin (https://miliukhin.xyz/)

pkgname=uwd-git
_name="${pkgname%-git}"

pkgver=r3.a44b096
pkgver() {
	cd "$srcdir/${_name%-VCS}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1

pkgdesc='Command-line interface for Ukrainian web dictionaries'
arch=('x86_64')
url="https://github.com/miliukhin/$_name"
license=('GPL-3.0-or-later')

provides=("$_name")
conflicts=("$_name")

makedepends=('git' 'go')
depends=('glibc' 'mdr' 'w3m' 'html2text' 'sed')

options=('zipman')

install="$_name.install"
source=("git+$url")
sha256sums=('SKIP')


package() {
  cd "$_name"
  make PREFIX=/usr DESTDIR="$pkgdir" -s install
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/$_name/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
