# Maintainer: Lukas Tobler <luk4s.tobler@gmail.com>

pkgname=i3lock-lixxia-git
pkgver=r255.d0ca5ad
pkgrel=4
pkgdesc="An improved screenlocker based upon XCB and PAM (Lixxia fork)"
arch=('i686' 'x86_64')
url="https://github.com/Lixxia/i3lock"
license=('MIT')
groups=("i3")
depends=('xcb-util-image' 'libev' 'cairo' 'libxkbcommon-x11')
options=('docs')
replaces=('i3lock')
provides=('i3lock')
conflicts=('i3lock')
backup=("etc/pam.d/i3lock")
source=("git://github.com/Lixxia/i3lock.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/i3lock"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/i3lock"
  make
  gzip i3lock.1
}

package() {
  cd "${srcdir}/i3lock"
  make DESTDIR="${pkgdir}" install

  install -Dm644 i3lock.1.gz ${pkgdir}/usr/share/man/man1/i3lock.1.gz
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  make clean
}

# vim:set ts=2 sw=2 et:
