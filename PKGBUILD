# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgname=ghi
pkgver=1.2.0.r23.g0bf0e97
pkgrel=2
pkgdesc='GitHub Issues on the command line'
arch=('any')
url="https://github.com/stephencelis/${pkgname}"
license=('MIT')
depends=('ruby')
makedepends=('git')
# inactive, so grab the latest commit
_commit=0bf0e97016b36d8746fabd6dd71f79e94134407f
source=("git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}"/${pkgname}

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}"/${pkgname}

    # built version is committed to repo, will only change dates in manpage
    #rake build man
}

package() {
    cd "${srcdir}"/${pkgname}

    # doesn't respect DESTDIR, reruns build steps
    #PREFIX="${pkgdir}/usr/" rake install

    install -Dm755 -t "${pkgdir}"/usr/bin ghi
    install -Dm644 -t "${pkgdir}"/usr/share/man/man1 man/ghi.1
    install -Dm644 -t "${pkgdir}"/usr/share/licenses/${pkgname} LICENSE
}
