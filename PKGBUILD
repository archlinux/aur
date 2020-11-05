# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>

pkgname='app-icon-preview'
pkgver=2.1.2
pkgrel=1
pkgdesc='Tool for designing applications icons'
arch=('x86_64')
url='https://gitlab.gnome.org/World/design/app-icon-preview'
license=('GPL3')
depends=('gtk3' 'libhandy0')
makedepends=('git' 'meson' 'rust')
source=("git+${url}.git#tag=${pkgver}"
        "git+https://gitlab.gnome.org/Teams/Design/HIG-app-icons.git")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd "${pkgname}"
  # Submodule list: https://gitlab.gnome.org/World/design/app-icon-preview/-/blob/master/.gitmodules
  git submodule init
  git config 'submodule.hig.url' "${srcdir}/HIG-app-icons"
  git submodule update
}

build() {
  arch-meson "${pkgname}" 'build'
  meson compile -C 'build'
}

package() {
  DESTDIR="${pkgdir}" meson install -C 'build'
  install -Dvm644 "${pkgname}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
