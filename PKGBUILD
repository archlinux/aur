# Maintainer: seth <getchoo at tuta dot io>

pkgname=zsh-antidote
_pkgname=antidote
pkgver=1.6.4
pkgrel=1
pkgdesc="the cure to slow zsh plugin management"
arch=(any)
url="https://getantidote.github.io/"
license=('MIT')
depends=('zsh' 'git')
install=zsh-antidote.install
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/mattmc3/antidote/archive/refs/tags/v${pkgver}.tar.gz"
  "0001-no-self-updating.patch"
)
sha256sums=('336ea89aab33d07d5d2eaa14af2f015d7da657837f64d3e76fa5c54645210950'
            'dd4bad447383091b29e47add48394a00a459eb87cd2d76c5ea110fc261ed2785')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  patch -p1 -i "${srcdir}/0001-no-self-updating.patch"
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm0644 -t "${pkgdir}/usr/share/${pkgname}/" "${_pkgname}.zsh"
  cp -r functions/ "${pkgdir}/usr/share/${pkgname}/"
  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
  find man/man1/ -type f -name '*.1' -exec \
    install -Dm644 -t "${pkgdir}/usr/share/man/man1" {} \;
}

# nvim: set ts=2 sw=2 et:
