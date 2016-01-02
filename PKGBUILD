# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
_pkgbasename=jackctlmmc
pkgname=${_pkgbasename}-git
pkgver=v4.r2.g0f490af
pkgrel=1
pkgdesc="MMC Control for JACK transport"
arch=('i686' 'x86_64')
url="http://jackctlmmc.sourceforge.net/"
license=('GPL')
depends=('jack' 'qt4')
makedepends=('git')
provides=("${_pkgbasename}")
conflicts=("${_pkgbasename}")
source=("${_pkgbasename}::git://repo.or.cz/jackctlmmc.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgbasename}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgbasename}"

    ./configure --prefix=/usr --enable-lash=no
    make
}

package() {
    cd "${srcdir}/${_pkgbasename}"
    make DESTDIR="${pkgdir}" install
}

