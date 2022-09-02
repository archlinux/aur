# Maintainer: seth <getchoo at tuta dot io>

pkgname=zsh-antidote
_pkgname=antidote
pkgver=1.6.3
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
sha256sums=('1817ea319e1f95b655872876c55df35bf404ed671053b751a81750550ca03248'
            '8dd03cfbfb9a838931e12ccf6da5ed6917e36fd873ff2fff25fbad63ff9d4265')

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
