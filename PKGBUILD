# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=instamenu 
pkgver=2020.12.30
pkgrel=1
pkgdesc="dmenu like menu with the Manjaro Matcha-dark-sea theme"
url="https://github.com/TheCynicalTeam/$pkgname"
arch=('any')
license=('GNU General Public License v3.0')
depends=('sh' 'libxinerama' 'libxft' 'noto-fonts-emoji' 'ttf-joypixels' 'siji' 'cantarell-fonts' 'nerd-fonts-fira-code' 'instamenu-schemas')
optdepends=('instamenu-extra: Extra script that instamenu can use')
provides=($pkgname dmenu)
conflicts=(dmenu)
replaces=(dmenu)
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('727e4b10c261559610f412708aaad7c4ceda5c489769cc219276acff662d2c69')

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
