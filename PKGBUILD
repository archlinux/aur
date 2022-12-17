# Maintainer: Leo <i@setuid0.dev>

pkgname=phpstan
pkgver=1.9.3
pkgrel=1
pkgdesc="PHP Static Analysis Tool"
url="https://phpstan.org/"
arch=("any")
license=("MIT")
depends=("php>=7.2.0")
optdepends=()

source=(
    "${pkgname}-${pkgver}.phar::https://github.com/phpstan/phpstan/releases/download/${pkgver}/phpstan.phar"
    "${pkgname}-${pkgver}.phar.asc::https://github.com/phpstan/phpstan/releases/download/${pkgver}/phpstan.phar.asc"
    "https://raw.githubusercontent.com/phpstan/phpstan/${pkgver}/LICENSE"
)
validpgpkeys=(
    "D32680D5957DC7116BE29C14CF1A108D0E7AE720"
)

# Just let makepkg happy.
# upstream does not release hash,
# but verify by gpg signatures.
md5sums=(
    SKIP
    SKIP
    SKIP
)

package() {
    install -D -m 644 \
        "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -D -m 755 \
        "${srcdir}/${pkgname}-${pkgver}.phar" \
        "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"

    install -d "${pkgdir}/usr/bin"

    ln -s \
        "/usr/share/webapps/bin/${pkgname}.phar" \
        "${pkgdir}/usr/bin/${pkgname}"
}
