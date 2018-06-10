# Maintainer: wenLiangcan <boxeed at gmail dot com>
# Contributor: ender4 <astrothayne@gmail.com>

pkgname=ammonite
pkgver=1.1.2
pkgrel=1
pkgdesc="A cleanroom re-implementation of the Scala REPL from first principles. "
arch=('any')
url="https://github.com/lihaoyi/Ammonite"
license=('MIT')
_scalaver=2.12
depends=("scala>=${_scalaver}" 'java-environment=8')
source=("ammonite-repl-${pkgver}"::"https://github.com/lihaoyi/Ammonite/releases/download/${pkgver}/${_scalaver}-${pkgver}"
        'https://github.com/lihaoyi/Ammonite/raw/master/LICENSE')
noextract=("ammonite-repl-${pkgver}")
sha256sums=('2cbbec93b8ace067f9fcaa30615b1d815b3a094b1c2c2ec5c09ef6a3fcc954ad'
            '90320c4bcccf8df57cc5d6f7b0b1778231ae87c64fe5405bae45af4ff9f87e8e')
install="${pkgname}.install"

package() {
    if [[ -z $JAVA_HOME ]]; then
        JAVA_HOME=$(ls -d /usr/lib/jvm/java-8-* | head -n 1)
    fi
    sed -i "2s|^exec java|exec $JAVA_HOME/bin/java|" "ammonite-repl-${pkgver}"
    install -Dm755 "ammonite-repl-${pkgver}" "${pkgdir}/usr/bin/amm"
    install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

