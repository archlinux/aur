# Maintainer: Slash <youremail@domain.com>

pkgname=weechat-poljar-matrix-git
pkgver=r614.b136153
pkgrel=1
pkgdesc="Python plugin for Weechat to communicate over the Matrix protocol"
arch=('any')
url="https://github.com/poljar/weechat-matrix"
license=('custom')
groups=()
depends=('cython2' 'python2-atomicwrites' 'python2-attrs' 'python2-future'
    'python2-h11' 'python2-h2' 'python2-jsonschema' 'python2-logbook'
    'python2-matrix-nio' 'python2-olm' 'python2-peewee' 'python2-pygments'
    'python2-pyopenssl' 'python2-typing' 'python2-unpaddedbase64'
    'python2-webcolors')
makedepends=('git')
provides=('weechat-poljar-matrix')
conflicts=('weechat-poljar-matrix')
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

    # Install License
    install -D -m 644 'LICENSE' \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
