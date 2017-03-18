# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: megadriver <megadriver at gmx dot com>
# Based on clearlooks-phenix-gtk-theme-git, also in the AUR

pkgname=clearlooks-phenix-gtk-theme
pkgver=7.0.1
pkgrel=2
pkgdesc="GTK3 theme visually close to Clearlooks"
arch=('any')
url="https://github.com/jpfleury/clearlooks-phenix"
license=('GPL3')
depends=('gtk-engines')
optdepends=('mist-icon-theme: a visually compatible icon theme')
makedepends=('inkscape')
conflicts=('clearlooks-phenix-gtk-theme-git')
source=("https://github.com/jpfleury/clearlooks-phenix/archive/${pkgver}.tar.gz"
        "001-stray-brace.patch"
        "002-font-defs.patch")
sha256sums=('2a9b21400f9960422e31dc4dabb4f320a16b76776a9574f0986bb00e97d357f4'
            'cec5858505fff05fcc9d1187053f184c1a6c07015327d5a5545cfb741965f56c'
            'ee742dfe781b8dda8034a9c471fee4c296b3afc4e5663a2fd0b0499deddb901c')

prepare() {
  cd "clearlooks-phenix-${pkgver}"

  patch -p1 < "${srcdir}/001-stray-brace.patch"
  patch -p1 < "${srcdir}/002-font-defs.patch"
}

build() {
  cd "clearlooks-phenix-${pkgver}"

  # Prefer building icons from SVG source
  make -C _src clean all
}

package() {
  cd "clearlooks-phenix-${pkgver}"

  mkdir -p "${pkgdir}/usr/share/themes/Clearlooks-Phenix"
  cp -a gtk-2.0 gtk-3.0 index.theme metacity-1 openbox-3 wallpapers xfwm4 \
     "${pkgdir}/usr/share/themes/Clearlooks-Phenix"

  install -D -m 0644 -t "${pkgdir}/usr/share/doc/${pkgname}" doc/* *.md
}

# vim:set ts=2 sw=2 et:
