# Maintainer: Alex Mekkering <amekkering at gmail dot com>

pkgname=horepg
pkgver=r53.1b3d213
pkgrel=1
pkgdesc="Parses EPG data from the service at horizon.tv for usage in TVHeadend."
arch=('any')
url="https://github.com/beralt/horepg"
license=('MIT')
depends=('python-requests' 'tvheadend')
makedepends=('python-setuptools')
source=('git+https://github.com/beralt/horepg.git'
        'horepgd.service')
sha512sums=('SKIP'
            '3edcb62b46fa6087fe69191d34bfa4452a8745a7de32d92605d43deb9bf07107c7250dffb56933f4d7f6afe66bab1ecb1c6c97c2c31861ab99bfe76d4f8b3f89')
install=horepg.install

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"
    python setup.py install --root="${pkgdir}/"

    install -D -m 644 "../../horepgd.service" \
        "$pkgdir/usr/lib/systemd/system/horepgd.service"
}

