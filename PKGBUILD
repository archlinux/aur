# Contributor: Rorschach <r0rschach@lavabit.com>
# Contributor: Andrew Kravchuk <awkravchuk@gmail.com>
# Contributor: aericson <de.ericson@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=aarchup-git
pkgver=1.8.1.5.g32fe8c7
pkgrel=1
pkgdesc="Fork of archup a small and lightweight update-notifier for archlinux."
url="https://github.com/aericson/aarchup"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libnotify' 'gtk2')
makedepends=('git')
source=("git+https://github.com/stefanhusmann/aarchup.git")
md5sums=('SKIP')
backup=('usr/lib/systemd/system/aarchup.timer')
conflicts=('aarchup')
provides=('aarchup')
optdepends=('auracle: AUR support(--aur)')
install=aarchup.install

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's+-+.+g'
}

build() {
  cd ${pkgname%-git}/src
  autoconf
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%-git}/src
  make DESTDIR="$pkgdir/" install
}
