# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_subproject_name='chcase'
_subproject_commit='b430df2a3a4d369fa444dd8e38c262e365b74e35' # <-- NB: update on new version

pkgname=konbucase
pkgver=4.2.0
pkgrel=1
pkgdesc='Convert case of your text'
arch=('x86_64' 'aarch64')
url='https://github.com/ryonakano/konbucase'
license=('GPL3')
depends=('granite7' 'gtksourceview5' 'libhandy' 'sassc')
makedepends=('git' 'meson' 'vala' 'blueprint-compiler')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "git+${url%/*}/${_subproject_name}#commit=${_subproject_commit}")
sha256sums=('dd16a506b29918ee5a0f24503f42201edc63f57fd637c17e3ca9bab1eb4a985c'
            '77940d1dc984902f1c66242ce74e0b041e99c4fb43c8784a83df0e0f9ea4c4d7')

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
