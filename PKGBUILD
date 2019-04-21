# Contributor: Rorschach <r0rschach@lavabit.com>
# Contributor: Andrew Kravchuk <awkravchuk@gmail.com>
# Contributor: aericson <de.ericson@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=aarchup-git
pkgver=2.1.0.r1.ga8e4cf5
pkgrel=1
pkgdesc="Fork of archup a small and lightweight update-notifier for archlinux."
url="https://github.com/inglor/aarchup"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libnotify' 'gtk2')
makedepends=('git' 'cmake' 'ninja')
source=("git+https://github.com/inglor/aarchup.git")
md5sums=('SKIP')
conflicts=('aarchup')
provides=('aarchup')
optdepends=('auracle: AUR support(--aur)')
install=aarchup.install

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's+-+.r+' |tr - .
}

build() {
  cd ${pkgname%-git}/src
  cmake .. -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
  ninja all
}

package() {
  cd ${pkgname%-git}/src
  DESTDIR="$pkgdir/" ninja install
}
