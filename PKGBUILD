# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_subproject_name='chcase'
_subproject_commit='b430df2a3a4d369fa444dd8e38c262e365b74e35' # <-- NB: update on new version

pkgname=konbucase
pkgver=4.1.1
pkgrel=2
pkgdesc='Convert case of your text'
arch=('x86_64' 'aarch64')
url='https://github.com/ryonakano/konbucase'
license=('GPL3')
depends=('granite7' 'gtksourceview5' 'libhandy' 'sassc')
makedepends=('git' 'meson' 'vala' )
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "git+${url%/*}/${_subproject_name}#commit=${_subproject_commit}")
sha256sums=('d2b6e55c08e7fe81518498deb3a51841118c17b83ed0954aef1fa980b807a1a5'
            'SKIP')

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
