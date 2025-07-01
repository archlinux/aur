# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_subproject_name='chcase'
_subproject_commit='e1c664fdd8bded036fa1ce60747e1f92f889c2c4' # <-- NB: update on new version

pkgname=konbucase
pkgver=4.4.0
pkgrel=2
pkgdesc='Convert case of your text'
arch=('x86_64' 'aarch64')
url='https://github.com/ryonakano/konbucase'
license=('GPL-3.0-or-later')
depends=('gtksourceview5' 'libhandy' 'sassc' 'libadwaita')
makedepends=('git' 'meson' 'vala' 'blueprint-compiler')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "git+${url%/*}/${_subproject_name}#commit=${_subproject_commit}")
sha256sums=('f4b4d962b998157bba85da8500062c6d9426a934762c40da1e931a86de85222d'
            '4b0b9e8133ee94c9bc3941b65e9b6a46f887bdb32e6ed2922ae72f9a80513073')

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
