# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=libmakepkg-srcaudit
pkgver=0.1.0
pkgrel=1
pkgdesc='Unofficial framework for source code audit hooks that plugs into makepkg'
arch=('any')
url='https://gitlab.archlinux.org/auerhuhn/libmakepkg-srcaudit'
license=('GPL-2.0-or-later')
depends=('bash' 'pacman')
makedepends=('python-myst-parser' 'python-sphinx')
options=('!debug' '!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://gitlab.archlinux.org/auerhuhn/libmakepkg-srcaudit/-/archive/v${pkgver}/libmakepkg-srcaudit-v${pkgver}.tar.gz"
)

sha512sums=(
  '171ab4264887fef42a84b70f86fd21cbc56a56fd60b58b8574fb01d5a75b8a1ebe6d00eb6a5cd83b9f08af9154289439f7c47b11c07c60b3a1ed8bfd994bf16c'
)

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  sphinx-build -aqEW -b man doc/sphinx build/man
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  install -D -m 644 -t "${pkgdir}/usr/lib/tmpfiles.d" \
    'contrib/tmpfiles.d/libmakepkg-srcaudit.conf'
  install -D -m 644 -t "${pkgdir}/usr/share/makepkg" \
    src/*.sh
  install -D -m 644 -t "${pkgdir}/usr/share/makepkg/buildenv" \
    src/buildenv/*.sh
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    'README.md'
  install -D -m 644 -t "${pkgdir}/usr/share/man/man3" \
    build/man/*.3
  install -D -m 644 -t "${pkgdir}/usr/share/${pkgname}/examples" \
    contrib/examples/*.sh
}
