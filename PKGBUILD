# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=libmakepkg-hexora
pkgver=0.1.0
pkgrel=1
pkgdesc='Drop-in that enables makepkg to scan upstream Python sources for suspicious patterns using Hexora'
arch=('any')
url='https://gitlab.archlinux.org/auerhuhn/libmakepkg-hexora'
license=('GPL-2.0-or-later')
depends=('bash' 'hexora' 'jq' 'libmakepkg-srcaudit' 'moreutils')
makedepends=('python-myst-parser' 'python-sphinx')
options=('!debug' '!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://gitlab.archlinux.org/auerhuhn/libmakepkg-hexora/-/archive/v${pkgver}/libmakepkg-hexora-v${pkgver}.tar.gz"
)

sha512sums=(
  'a4e08c7fdd87ae3d3432b538e695ceeceb491af1bb787f114241ae5aec5d715d96b827e5f700c54932ee9c9edd20527aa0f0fcc7a0224b5aae682f001675cc4c'
)

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  sphinx-build -aqEW -b man doc/sphinx build/man
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  install -D -m 644 -t "${pkgdir}/usr/share/makepkg/srcaudit" \
    src/srcaudit/*.sh
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    'README.md'
  install -D -m 644 -t "${pkgdir}/usr/share/man/man7" \
    build/man/*.7
  install -D -m 644 -t "${pkgdir}/usr/share/${pkgname}/examples/hxignore" \
    contrib/examples/hxignore/.hxignore.jsonl
}
