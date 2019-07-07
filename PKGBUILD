# Maintainer: Yiqiao Wang <yiqiao.wang96 at gmail dot com>
# Contributor: wenLiangcan <boxeed at gmail dot com>
pkgname=ammonite
pkgver=1.6.9
pkgrel=1
pkgdesc="A cleanroom re-implementation of the Scala REPL from first principles. "
arch=('any')
url="https://github.com/lihaoyi/Ammonite"
license=('MIT')
_scalaver=2.12
depends=("scala>=${_scalaver}" java-environment)
source=("ammonite-repl-${pkgver}"::"https://github.com/lihaoyi/Ammonite/releases/download/${pkgver}/${_scalaver}-${pkgver}"
        "https://github.com/lihaoyi/Ammonite/raw/${pkgver}/LICENSE")
noextract=("ammonite-repl-${pkgver}")
sha256sums=('a0b980d7c3a2508cdd7f4954c34c14d0261fb1e973a1264e070037cb269025ba'
            '90320c4bcccf8df57cc5d6f7b0b1778231ae87c64fe5405bae45af4ff9f87e8e')
install="${pkgname}.install"

prepare() {
  echo '#!/bin/sh' > "$srcdir/amm"
  cat "ammonite-repl-${pkgver}" >> "$srcdir/amm"
}

package() {
    install -Dm755 "$srcdir/amm" "${pkgdir}/usr/bin/amm"
    install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
