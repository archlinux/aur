# Maintainer: José Almeida <jose.afga@gmail.com>

pkgname=bananapkg-git
pkgver=r174.22d38d3
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
    sed --in-place 's@/usr/libexec@/usr/lib@g' {banana,core.sh}

    # install files manually
    install -Dm755 -t "${pkgdir}/usr/bin/" "banana"
    install -Dm644 -t "${pkgdir}/usr/share/man/pt_BR/man8/" 'banana.8'
    install -Dm644 -t "${pkgdir}/usr/lib/banana/" {core,help}'.sh'
    install -Dm644 -t "${pkgdir}/etc/banana/" "banana.conf"
    mkdir -p "${pkgdir}/var/lib/banana/"{list,desc,remove} # create dirs
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" 'LICENSE'
}
