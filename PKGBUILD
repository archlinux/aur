# Maintainer: Slash <youremail@domain.com>

pkgname=weechat-poljar-matrix-git
pkgver=r701.6d58ff0
pkgrel=1
pkgdesc="Python plugin for Weechat to communicate over the Matrix protocol"
arch=('any')
url="https://github.com/poljar/weechat-matrix"
license=('custom')
groups=()
depends=('python-aiohttp' 'python-atomicwrites' 'python-attrs' 'python-future' 'python-logbook'
         'python-nio' 'python-pygments' 'python-pyopenssl' 'python-webcolors')
makedepends=('git')
provides=('weechat-poljar-matrix')
conflicts=('weechat-poljar-matrix')
install='weechat-poljar-matrix-git.install'
source=('weechat-matrix::git+https://github.com/poljar/weechat-matrix.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/weechat-matrix"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/weechat-matrix"

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
