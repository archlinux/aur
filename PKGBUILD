# Contributor : abdus <nail@abdus.xyz>
# Contributor : Jack Rubacha <rubacha.jack03@gmail.com>
# Maintainer: Frederic Bezies <fredbezies at gmail dot com>

pkgname=2048.c
_pkgname=2048
pkgver=1.0.0.r0.g3eb237f
pkgrel=1
epoch=1
pkgdesc="A terminal 2048 written in c"
arch=('any')
url="https://github.com/mevdschee/2048.c"
license=('MIT')
source=(git+https://github.com/mevdschee/2048.c.git)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-48
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
      cd "${srcdir}/${pkgname}"
      make DESTDIR="$pkgdir/" install

      install -Dm644 "debian_$_pkgname.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
      install -Dm644 "$_pkgname.desktop" "${pkgdir}/usr/share/applications/$_pkgname.desktop"
      install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'	
}

