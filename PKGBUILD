# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=instamenu 
pkgver=2021.01.01
pkgrel=1
pkgdesc="dmenu like menu with the Manjaro Matcha-dark-sea theme"
url="https://github.com/TheCynicalTeam/$pkgname"
arch=('any')
license=('GPL3')
depends=('sh' 'libxinerama' 'libxft' 'noto-fonts-emoji' 'ttf-joypixels' 'siji' 'cantarell-fonts' 'nerd-fonts-fira-code' 'instamenu-schemas')
optdepends=('instamenu-extra: Extra script that instamenu can use')
provides=($pkgname dmenu)
conflicts=(dmenu)
replaces=(dmenu)
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('22c490daf55d7bcdb352aadea7f9d7389d8f231aaa28ced3da8b2b9500565195')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make \
    X11INC=/usr/include/X11 \
    X11LIB=/usr/lib/X11
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
