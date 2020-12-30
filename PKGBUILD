# Contributor: tsester <univ@lavabit.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=agedu-git
pkgver=20200704.r149.2a7d4a2
pkgrel=1
pkgdesc="Track down wasted disk space"
arch=('i686' 'x86_64')
url="http://www.chiark.greenend.org.uk/~sgtatham/agedu/"
license=('custom:MIT')
makedepends=('git' 'halibut')
depends=('glibc')
provides=('agedu')
conflicts=('agedu')
source=("git+https://git.tartarus.org/simon/agedu.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "%s.r%s.%s" $(git log -1 --format="%cd" --date=short|tr -d - ) $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
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
