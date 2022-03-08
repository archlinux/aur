# Contributor: Rorschach <r0rschach@lavabit.com>
# Contributor: Andrew Kravchuk <awkravchuk@gmail.com>
# Contributor: aericson <de.ericson@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=aarchup-git
pkgver=2.1.7
pkgrel=1
pkgdesc="Fork of archup a small and lightweight update-notifier for archlinux."
url="https://github.com/inglor/aarchup"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libnotify' 'gtk2')
makedepends=('git' 'cmake' 'meson' 'ninja')
source=("git+https://gitlab.com/artafinde/aarchup.git")
md5sums=('SKIP')
conflicts=('aarchup')
provides=('aarchup')
optdepends=('auracle: AUR support(--aur)')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's+-+.r+' |tr - .
}

build() {
  cd ${pkgname%-git}
  meson --prefix=/usr --buildtype=plain . build
  meson compile -C build
}

package() {
  cd ${pkgname%-git}
  DESTDIR="$pkgdir/" ninja install -C build
}
