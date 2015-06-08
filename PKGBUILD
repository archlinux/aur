# Maintainer: Adrien Sohier <adrien.sohier@art-software.fr>

pkgname=i3lock-lixxia-git
pkgver=cd615c
pkgrel=2
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
source=("git://github.com/Lixxia/i3lock.git"
        "24hour.patch")
md5sums=('SKIP'
         '2b4a24174ab2335049bfafcf04e9b24e')

pkgver() {
  cd "${srcdir}/i3lock"
  git describe --always | cut -c2- | tr "-" "."
}

prepare() {
    cd "${srcdir}/i3lock"
    patch -Np1 -i "${srcdir}/24hour.patch"
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

