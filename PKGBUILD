# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=pcspkr-git
pkgver=r18.f0b68bc
pkgrel=1
pkgdesc='listen to pcm sound over the internal pc speaker'
arch=(x86_64)
url=https://github.com/xdsopl/pcspkr
license=('custom:CC0 1.0')
depends=(glibc)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+"${url}".git)
md5sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname%-git}"
    make
}

package() {
    cd "${pkgname%-git}"
    install -Dm755 -t "${pkgdir}"/usr/bin measure pwm sdm
    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
