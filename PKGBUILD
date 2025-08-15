# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: abdus <nail@abdus.xyz>
# Contributor: Jack Rubacha <rubacha.jack03@gmail.com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>

pkgname=2048.c
pkgver=1.0.3.r4.g4645182
pkgrel=2
epoch=1
pkgdesc="A terminal 2048 written in c"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/mevdschee/2048.c"
license=('MIT')
depends=('glibc' 'hicolor-icon-theme')
source=(git+https://github.com/mevdschee/2048.c.git#commit=464518299836a0fe843221edfddae5ddc05b7920)
sha256sums=('78cd036e27fafe2479d380a48a39045d3db909110a1348abe2dd81b990c7e97f')

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

      install -Dm755 2048 "$pkgdir/usr/bin/${pkgname}"
      install -Dm644 "debian_${pkgname::-2}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
      install -Dm644 "${pkgname::-2}.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"
      install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'

      sed -i 's/2048/2048.c/g' "$pkgdir/usr/share/applications/$pkgname.desktop"
}

