# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Contributor: Ben Mitchell <dezyh@outlook.com>

pkgname=patchup-bin
pkgver=0.1.0
pkgrel=2
pkgdesc="A tool to compute and apply binary patches for files and directories"
url="https://github.com/patchup/cli"
license=("MIT")
arch=("x86_64")
makedepends=('help2man')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source=("patchup-cli-bin-${pkgver}.tar.gz::https://github.com/patchup/cli/releases/download/${pkgver}/patchup-cli-bin.tar.gz"
        "README.md")
sha256sums=('946ff094ac765a31a69fed314d5d78b650aa2d6ff84397e41c15a50ebaad6a59'
            'a21b4898f9e2fd5baf37a9e6dfa2aace0b9558088759d4ffcda9ac802d66e821')

build() {
    cd "${srcdir}" || exit

    chmod +x "./target/release/${pkgname%-bin}/${pkgname%-bin}"

    help2man "./target/release/${pkgname%-bin}/${pkgname%-bin}" --output "MAN-${pkgver}.1" --no-info --version-string "${pkgver}"
    gzip "MAN-${pkgver}.1"
}

package() {
    cd "${srcdir}" || exit

    install -Dm755 "./target/release/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname%-bin}.1"
}
