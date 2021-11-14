# Maintainer: Musee "lae" Ullah <lae(at)lae(dot)is>

pkgname=monacoin-bin
_coinname=monacoin
pkgver=0.20.2
pkgrel=1
pkgdesc="Binary release of the Monacoin alternative cryptocurrency."
arch=('x86_64')
url="https://monacoin.org/en/index.html"
license=('MIT')
provides=('monacoin-qt' 'monacoind' 'monacoin-tx')
conflicts=('monacoin-qt')
makedepends=('boost' 'libevent' 'qt5-base' 'qt5-tools' 'miniupnpc' 'protobuf')
optdepends=('qrencode: for generating QR codes within the GUI' 'zeromq: send notifications via zeromq')
source=("https://github.com/monacoinproject/${_coinname}/releases/download/v${pkgver}/monacoin-${pkgver}-x86_64-linux-gnu.tar.gz"
        "monacoin-qt.desktop"
        "monacoin256.xpm")
sha256sums=('c1aa06b2fe62481722a62afe6a855472ca362992c08db5b0df8eac3f4812596a'
            '4af25bac0076c6d2060832b66819741d3e049a71d6ad5f1a26a2700415d23cfc'
            'ddf39249561bc216d67194d6d87582e5738af0625fd1b6abe8f277851f7fe5bc')
install=monacoin.install

package() {
    install -Dm644 "${srcdir}/monacoin-qt.desktop" "${pkgdir}/usr/share/applications/monacoin-qt.desktop"
    install -Dm644 "${srcdir}/monacoin256.xpm" "${pkgdir}/usr/share/pixmaps/monacoin.xpm"

    cd "${srcdir}/${_coinname}-${pkgver}"
    install -Dm755 bin/monacoin-cli "${pkgdir}"/usr/bin/monacoin-cli
    install -Dm755 bin/monacoind "${pkgdir}"/usr/bin/monacoind
    install -Dm755 bin/monacoin-qt "${pkgdir}"/usr/bin/monacoin-qt
    install -Dm755 bin/monacoin-tx "${pkgdir}"/usr/bin/monacoin-tx
    install -Dm644 share/man/man1/monacoin-cli.1 "${pkgdir}"/usr/share/man/man1/monacoin-cli.1
    install -Dm644 share/man/man1/monacoind.1 "${pkgdir}"/usr/share/man/man1/monacoind.1
    install -Dm644 share/man/man1/monacoin-qt.1 "${pkgdir}"/usr/share/man/man1/monacoin-qt.1
    install -Dm644 share/man/man1/monacoin-tx.1 "${pkgdir}"/usr/share/man/man1/monacoin-tx.1
}
