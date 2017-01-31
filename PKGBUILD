# Maintainer : Davi da Silva Böger <dsboger at gmail dot com>
# Contributor : adytzu2007 <adybac at gmail {dot} com>
# Contributor: Samsagax <samsagax at gmail {dot} com>
# Contributor : abbradar <nikoamia at gmail {dot} com>

pkgname=bbswitch-dkms-git
pkgver=0.8.r0.g0c38f97
pkgrel=1
pkgdesc="kernel module allowing to switch dedicated graphics card on Optimus laptops, dkms version"
arch=('i686' 'x86_64')
url="http://github.com/Bumblebee-Project/bbswitch"
license=('GPL')
provides=('bbswitch')
conflicts=('bbswitch-git' 'bbswitch' 'dkms-bbswitch')
depends=('dkms' 'linux-headers')
makedepends=('git')
_gitroot='git://github.com/Bumblebee-Project/bbswitch.git'
_gitname='bbswitch'
_gitbranch='develop'
source=("${_gitname}::${_gitroot}#branch=${_gitbranch}")
sha256sums=("SKIP")

pkgver() {
    cd "$srcdir/${_gitname}"
    git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_gitname}"

    # create dkms.conf
    sed -e "s/#MODULE_VERSION#/${pkgver}/" < "dkms/dkms.conf" > dkms.conf
}

package() {
  cd "${srcdir}/${_gitname}"
  install -dm755 "${pkgdir}/usr/src/bbswitch-${pkgver}/"
  cp -r * "${pkgdir}/usr/src/bbswitch-${pkgver}/"
}
