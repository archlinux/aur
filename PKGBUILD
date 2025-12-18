# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=parcellite-git
pkgver=1.2.5.r3.4a0eafd
pkgrel=1
pkgdesc="Lightweight GTK clipboard manager (git version)"
arch=('x86_64')
url="https://github.com/rickyrockrat/${pkgname%%-*}"
license=('GPL-3.0-or-later')
depends=('gtk3')
makedepends=('git'
             'intltool'
             'psmisc')
optdepends=('xdotool: auto-paste support')
conflicts=('parcellite')
provides=('parcellite')
source=("$pkgname::git+https://github.com/rickyrockrat/${pkgname%%-*}"
        port-to-gtk-3.patch)
sha512sums=('SKIP'
            '394301c66caedd092a1b6dacb8b8eb2a338ab301c07e5bf136154898a2ef500adcb8543cd08e43ba45fae27f8200bf5cafc0b1f6d8328cd4c8193fe8175066b6')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -Np1 -i ../port-to-gtk-3.patch
}

build() {
  cd "${srcdir}/${pkgname}"
  make VERSION="${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" prefix=/usr sysconfdir=/etc install
}
