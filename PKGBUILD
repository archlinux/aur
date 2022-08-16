# Maintainer: seth <getchoo at tuta dot io>

pkgname=zsh-antidote
_pkgname=antidote
pkgver=1.4.0
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
sha256sums=('84048aa790b539d79008f690dd4694f97c479c1a2f3159ff0fff69a293528d76'
            'f45a3380864145f31ba1f9ce771f156f104e5b70dae1d1de46ba5177cdc4e88e')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  patch -p1 -i "${srcdir}/0001-no-self-updating.patch"
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm0644 -t "$pkgdir/usr/share/${_pkgname}/" "${_pkgname}.zsh"
  cp -r functions/ "$pkgdir/usr/share/${_pkgname}/"
}

# nvim: set ts=2 sw=2 et:
