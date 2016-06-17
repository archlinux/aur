# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Ianis G. Vasilev <mail@ivasilev.net>

pkgname=psmouse-alpsv7-dkms
pkgver=r33.24a4ac5
pkgrel=1
pkgdesc='psmouse kernel module with support for alpsv7 touchpad'
arch=('any')
url='https://github.com/he1per/psmouse-dkms-alpsv7'
license=('GPL2')
depends=('dkms')
optdepends=('linux-headers: build modules against the Arch kernel'
            'linux-lts-headers: build modules against the LTS kernel'
            'linux-zen-headers: build modules against the ZEN kernel'
            'linux-grsec-headers: build modules against the GRSEC kernel'
            'linux-rt-headers: build modules against the RealTime kernel')
source=('psmouse-alpsv7-dkms::git://github.com/he1per/psmouse-dkms-alpsv7.git'
        'kernel-4.patch::https://github.com/hyslion/psmouse-dkms-alpsv7/commit/f81f0ec2af851a78cd5a2b778c0d51a10fa01999.patch')

md5sums=('SKIP'
         'c573b665d5432da4738f7d96a7593608')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname}"
    patch -p1 < "../kernel-4.patch"
}

package() {
    cd "${srcdir}/${pkgname}"

    local dest="${pkgdir}/usr/src/${pkgname/-dkms/}-${pkgver}"

    mkdir -p "${dest}"
    cp -RL "src/" "dkms.conf" "${dest}"
}
