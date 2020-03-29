# Maintainer: Slash <youremail@domain.com>

pkgname=weechat-poljar-matrix
pkgver=0.1.0
pkgrel=1
pkgdesc="Python plugin for Weechat to communicate over the Matrix protocol"
arch=('any')
url="https://github.com/poljar/weechat-matrix"
license=('custom')
groups=()
depends=('python-aiohttp' 'python-atomicwrites' 'python-attrs' 'python-future' 'python-logbook'
         'python-nio' 'python-pygments' 'python-pyopenssl' 'python-webcolors')
provides=('weechat-poljar-matrix')
conflicts=('weechat-poljar-matrix')
install='weechat-poljar-matrix.install'
source=("weechat-matrix-${pkgver}.tar.gz::https://github.com/poljar/weechat-matrix/archive/${pkgver}.tar.gz")
sha256sums=('f12ba287f8ac9d7870f40cf5be1651b6bf39c6d0b01efc3e34c5b761d72f9af2')

package() {
    cd "${srcdir}/weechat-matrix-${pkgver}"

    # Install plugin scripts
    make WEECHAT_HOME="${pkgdir}/usr/lib/weechat" install

    # Install contrib scripts
    for script in contrib/*; do
        install -D -m 755 "${script}" \
            "${pkgdir}/usr/lib/weechat/python/matrix/${script}"
    done;

    # Install License
    install -D -m 644 'LICENSE' \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
