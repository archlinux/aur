# Maintainer: zefr0x < Matrix: "@zer0-x:kde.org" >

pkgname="cwitch"
pkgver="0.3.0"
pkgrel=1
pkgdesc="CLI tool to watch Twitch live streams and videos with the help of mpv and yt-dlp."
arch=('any')
url="https://github.com/zefr0x/cwitch"
license=('GPL3')
depends=('mpv' 'python-mpv' 'yt-dlp' 'python-prompt_toolkit')
makedepends=('python-setuptools')
# checkdepends = ('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("a45735c00868a65b177fcddecdd1326e9b14572f1353f99eb510a7a983dad0d220c5150db71bdeba6c97369e038449fbf50e2a7d1f8f4241afa12c8955ad477c")

build() {
    cd "${pkgname}-${pkgver}"

    python3 setup.py build
}

# check() {
#     cd "${pkgname}-${pkgver}"
#
#     pytest
# }

package() {
    cd "${pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

    # TODO: Install shell completions when they are avialable in the source.

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
