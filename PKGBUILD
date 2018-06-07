# Maintainer: Jonathan Waldrep <spartan074 at gmail dot com>
# Contributor: Niklas Bolander <niklas.bolander at gmail dot com>

pkgname=zsh-fast-syntax-highlighting-git
pkgver=r204.f31a2d0
pkgrel=1
pkgdesc='Optimized and extended zsh-syntax-highlighting'
arch=('any')
url='https://github.com/zdharma/fast-syntax-highlighting'
license=('BSD')
depends=('zsh')
makedepends=('git')
source=('git+https://github.com/zdharma/fast-syntax-highlighting.git')
sha512sums=('SKIP')

_gitname='fast-syntax-highlighting'

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  typeset _plugindir="${pkgdir}/usr/share/zsh/plugins/${_gitname}"
  typeset _licdir="${pkgdir}/usr/share/licenses/${pkgname}"
  typeset _chromadir="${_plugindir}/chroma"
  typeset _themesdir="${_plugindir}/themes"

  cd "${srcdir}/fast-syntax-highlighting"

  install -dm0755 "${_plugindir}"
  install -m0644 'fast-syntax-highlighting.plugin.zsh' "${_plugindir}"
  install -m0644 -- '-fast-run-git-command' "${_plugindir}"
  install -m0644 'fast-highlight' "${_plugindir}"
  install -m0644 'fast-read-ini-file' "${_plugindir}"
  install -m0644 'fast-theme' "${_plugindir}"

  install -dm755 "${_licdir}"
  install -m0644 LICENSE "${_licdir}"

  cd "${srcdir}/fast-syntax-highlighting/chroma"
  install -dm0755 "${_chromadir}"
  install -m0644 -- *.ch "${_chromadir}"

  cd "${srcdir}/fast-syntax-highlighting/themes"
  install -dm0755 "${_themesdir}"
  install -m0644 -- *.ini "${_plugindir}/themes"
}

# vim:set syntax=PKGBUILD ts=2 sw=2 et:
