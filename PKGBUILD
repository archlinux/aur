# Maintainer: marmis <tiagodepalves@gmail.com>

_pkgname=shellcheck
pkgname="${_pkgname}-doc"
pkgdesc='man pages for shellcheck-bin'
pkgver=0.10.0
pkgrel=1
url='https://shellcheck.net'
arch=('any')
license=(GPL-3.0-or-later)
# this is a hard requirement, otherwise we would need to declare a conflict with
# extra/shellcheck, which would then block 'shellcheck-bin'
depends=('shellcheck-bin')
makedepends=('pandoc')
source=("https://raw.githubusercontent.com/koalaman/${_pkgname}/v${pkgver}/shellcheck.1.md"
        "https://raw.githubusercontent.com/koalaman/${_pkgname}/v${pkgver}/manpage")
b2sums=('76f2c729db93346677d16abcb1ff43ee95ab76a6057f49af90d71bfe77c9b1a1f5e98c525384cf198fba6a682a5a06af5514775e8261d577a3203e4e855503e0'
        'b52b528495a4be379cdfe226a3a1118e26f5faf71651464854d28ca1aee981a594e729acf9243f9de5574fa388778e4b180297f70349043453447f9fab383d70')

build() {
  cd "${srcdir}"
  chmod +x manpage
  ./manpage
}

package() {
  install -D -m644 "${srcdir}/${_pkgname}.1" -t "${pkgdir}/usr/share/man/man1"
}
