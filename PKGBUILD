# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_subproject_name='chcase'
_subproject_commit='0ce179bd1766309514a2495b01ad0fec69586ef8' # <-- NB: update on new version

pkgname=konbucase
pkgver=4.5.0
pkgrel=1
pkgdesc='Convert case of your text'
arch=('x86_64' 'aarch64')
url='https://github.com/ryonakano/konbucase'
license=('GPL-3.0-or-later')
depends=('gtksourceview5' 'libhandy' 'sassc' 'libadwaita')
makedepends=('git' 'meson' 'vala' 'blueprint-compiler')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "git+${url%/*}/${_subproject_name}#commit=${_subproject_commit}")
sha256sums=('0d6d1414f9be9e93918bd1ca3a9289d67e69294ba0122cdfc883302cf522a13f'
            'c13da7bb68933f72c7ca1adc1c3a4fc55dee4466d2f6507097ca6656bbcff299')

prepare() {
  rm -rf "${pkgname}-${pkgver}/subprojects/${_subproject_name}"
  ln -sf "${srcdir}/${_subproject_name}" "${pkgname}-${pkgver}/subprojects"
}

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
