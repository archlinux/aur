# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
#
# Based on the upstream PKGBUILD:
# https://build.opensuse.org/projects/openSUSE:Factory/packages/obs-service-source_validator/files/PKGBUILD?expand=1
#
# Pull requests are welcome on GitHub: https://github.com/yurikoles-aur/obs-service-source_validator
#

pkgname=obs-service-source_validator
pkgver=0.48
pkgrel=1
pkgdesc='An OBS source service: running all the osc source-validator checks'
arch=('any')
url='https://github.com/openSUSE/obs-service-source_validator'
license=('GPL-2.0-or-later')
depends=('obs-build' 'bzip2' 'cpio' 'diffutils' 'gnupg' 'libxml2' 'patch' 'perl-timedate' 'unzip' 'xz' 'zstd')
optdepends=('minisign: verify minisign signatures')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('39e2eb0d03ed2d22b38bc18edbe258246f1a1d939e8673dd2059b11160c575a7')

depends+=(
    git
    python
)

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR=$pkgdir install
}

check() {
    cd "$pkgname-$pkgver"
    make VERBOSE=1 test
}
