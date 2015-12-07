
# Maintainer: Matteo De Carlo <matteo.dek AT gmail DOT com>
pkgname=pencil-android-lollipop-stencils-git
pkgver=1.0.0.r3.ge573ed9
pkgrel=1
pkgdesc="Collection of common Android Lollipop UI elements for Pencil. All in vector format."
arch=(any)
url="https://github.com/nathanielw/Android-Lollipop-Pencil-Stencils/"
license=('MIT')
depends=('pencil')
makedepends=('pacman>=4.1.2' 'git')
install=
changelog=
_name="Android-Lollipop-Pencil-Stencils"
source=("git+https://github.com/nathanielw/${_name}.git")
noextract=()
md5sums=('SKIP')
_installdir="/usr/share/evolus-pencil/content/pencil/stencil/"

pkgver() {
  cd ${_name}
  git describe --long --tags 2>/dev/null | sed 's/[^[:digit:]]*\(.\+\)-\([[:digit:]]\+\)-g\([[:xdigit:]]\{7\}\)/\1.r\2.g\3/;t;q1'
  [ ${PIPESTATUS[0]} -ne 0 ] && \
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  DESTDIR="${pkgdir}/${_installdir}/${_name}"
  cd "${srcdir}/${_name}"
  
  install -m644 -Dt "${DESTDIR}" Definition.xml
  install -m644 -Dt "${DESTDIR}" README.MD
  install -m644 -Dt "${DESTDIR}/Icons" Icons/*
  install -m644 -Dt "${DESTDIR}/misc" misc/*
  install -Dm644 "${srcdir}/${_name}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}