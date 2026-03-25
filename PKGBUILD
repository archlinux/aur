# Maintainer: Akira-Amatsume <akira.uestc at gmail dot com>

pkgname=okular-session-git
_upstream_name=Okular-session
pkgver=r3.fa2ded8
pkgrel=1
pkgdesc='Session wrapper for Okular that restores previously opened PDFs'
arch=('any')
url='https://github.com/AkiraLyu/Okular-session'
license=('GPL3')
depends=('bash' 'coreutils' 'gawk' 'grep' 'okular' 'procps-ng' 'sed')
makedepends=('git')
provides=('okular-session')
conflicts=('okular-session')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_upstream_name}"
    printf 'r%s.%s' \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "${srcdir}/${_upstream_name}"

    install -Dm755 okular-session.sh "${pkgdir}/usr/bin/okular-session"
    install -Dm644 okular-session.desktop "${pkgdir}/usr/share/applications/okular-session.desktop"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
