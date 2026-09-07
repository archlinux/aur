# Maintainer: Kotsasmin <kotsasmin@gmail.com>
pkgname=kotsasmin-toolkit-git
pkgver=r15.64ca38e
pkgrel=1
pkgdesc="A collection of system optimization, security, and media scripts"
arch=('any')
url="https://github.com/Kotsasmin/toolkit"
license=('custom')
depends=('bash')
optdepends=(
    'yt-dlp: for media downloader'
    'ffmpeg: for media downloader'
    'docker: for security container audits'
    'npm: for node vulnerability audits'
    'screen: for running SCX P2DQ in background'
)
makedepends=('git')
provides=('kotsasmin-toolkit' 'toolkit')
conflicts=('kotsasmin-toolkit' 'toolkit')
source=("git+https://github.com/Kotsasmin/toolkit.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/toolkit"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "${srcdir}/toolkit"

    install -dm755 "${pkgdir}/usr/lib/toolkit"
    cp -r media optimization ptero security "${pkgdir}/usr/lib/toolkit/"
    install -Dm755 toolkit.sh "${pkgdir}/usr/lib/toolkit/toolkit.sh"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s /usr/lib/toolkit/toolkit.sh "${pkgdir}/usr/bin/toolkit"
    ln -s /usr/lib/toolkit/toolkit.sh "${pkgdir}/usr/bin/kotsasmin-toolkit"

    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
