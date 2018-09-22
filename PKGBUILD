# Contributor: tsester <univ@lavabit.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=agedu-git
pkgver=r131.8a8299e
pkgrel=2
pkgdesc="Track down wasted disk space"
arch=('i686' 'x86_64')
url="http://www.chiark.greenend.org.uk/~sgtatham/agedu/"
license=('custom:MIT')
makedepends=('subversion' 'halibut')
depends=('glibc')
provides=('agedu')
conflicts=('agedu')
source=("git://git.tartarus.org/simon/agedu.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd  ${pkgname%-git}
  ./mkauto.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd  ${pkgname%-git}
  make DESTDIR="$pkgdir/" install  
  install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
