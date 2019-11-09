# Maintainer: José Almeida <jose.afga@gmail.com>

pkgname=bananapkg-git
pkgver=r160.3e2d238
pkgrel=1
pkgdesc="Low-level package manager written in shell bash."
url="https://bananapkg.github.io"
license=('MIT')
arch=('any')
source=('git+https://github.com/slackjeff/bananapkg.git')
md5sums=('SKIP')
depends=(
    'bash>=4.4.18'
    'sed'
    'tar'
    'awk'
    'xz'
    'gnupg'
)

provides=('banana')
conflicts=('banana')

package() {
    cd bananapkg

    # replace /usr/libexec/banana to /usr/lib/banana
    sed --in-place 's@/usr/libexec@/usr/lib@g' {banana,core.sh,install.sh}

    # using default bananapkg installer
    ./install.sh DESTDIR="${pkgdir}"

    install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" 'LICENSE'
}
