# Maintainer: Alex Mekkering <amekkering at gmail dot com>

pkgname=horepg
pkgver=r61.77c04a8
pkgrel=1
pkgdesc="Parses EPG data from the service at horizon.tv for usage in TVHeadend."
arch=('any')
url="https://github.com/beralt/horepg"
license=('MIT')
depends=('python-requests' 'tvheadend')
makedepends=('python-setuptools')

###################################
# Use a specific commit for stability reasons
source=('git+https://github.com/beralt/horepg.git#commit=77c04a8')
###################################
# Enable the following line (& disable the previous one) to build using the most recent commit
# source=('git+https://github.com/beralt/horepg.git')

install=horepg.install

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"
    python setup.py install --root="${pkgdir}/"

    install -D -m 644 "dist/systemd/horepgd.service" "$pkgdir/usr/lib/systemd/system/horepgd.service"
    install -D -m 644 "dist/systemd/horepgd.timer" "$pkgdir/usr/lib/systemd/system/horepgd.timer"
}

md5sums=('SKIP')
