# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=parcellite-git
pkgver=1.2.5.r1.14628da
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
            'c9cc884f7f1492f9b4ee1a8f4f322cb10c3a691eaf511e9b655b5608d1414e0d19363a3ee788706caaa54854a72c37711587d6cad7a6db5195bd894a4f206b3b')

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
