# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_subproject_name='chcase'
_subproject_commit='f56e20de2fc775d58fcf534d321490ab8bd2facb' # <-- NB: update on new version

pkgname='konbucase'
pkgver=3.0.0
pkgrel=1
pkgdesc='Convert case of your text'
arch=('x86_64')
url='https://github.com/ryonakano/konbucase'
license=('GPL3')
depends=('granite' 'gtksourceview4')
makedepends=('git' 'meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "git+${url%/*}/${_subproject_name}#commit=${_subproject_commit}")
sha256sums=('30fa24cd910b03df0ea9e68f0b384fb8fdd57e689b30a98bdc63046417ff4b19'
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
