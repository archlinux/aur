# Maintainer: Joel Klinghed <the_jk at spawned dot biz>
pkgname=maestro-dev
pkgver=2.7.0
pkgrel=1
pkgdesc="End-to-end testing for Mobile and Web apps"
url="https://maestro.dev"
license=("Apache-2.0")
arch=("any")
depends=("java-runtime-headless>=17" "bash")

source=("maestro-${pkgver}.zip::https://github.com/mobile-dev-inc/maestro/releases/download/cli-${pkgver}/maestro.zip")
sha256sums=("a4ccab6b604617e7aef6db4f885666056eabe5cfa32befaa3bc994041b8fcbb5")

prepare() {
    for f in "${srcdir}"/maestro/lib/maestro-cli-*.jar; do
        [[ ! -e "$f" || "$f" == "${srcdir}"/maestro/lib/maestro-cli-"${pkgver}.jar" ]] && continue
        rm -f "$f"
    done
}

package() {
    # Create necessary directories
    install -dm755 "${pkgdir}/opt/maestro-dev"
    install -dm755 "${pkgdir}/usr/bin"

    # Copy all files from the extracted package
    cp -r "${srcdir}"/maestro/* "${pkgdir}/opt/maestro-dev/"

    # Create symlink in /usr/bin
    ln -s "/opt/maestro-dev/bin/maestro" "${pkgdir}/usr/bin/maestro"
}
