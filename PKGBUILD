# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="ecgpuwave"
pkgver="1.3.2"
pkgrel="1"
pkgdesc="Physionet QRS detector and waveform limit locator"
url="http://physionet.org/physiotools/ecgpuwave/"
license=('GPL')
arch=('i686' 'x86_64')
optdepends=('wfdb-samples')
changelog="ChangeLog"
source=("${pkgname}.tar.gz::http://www.physionet.org/physiotools/${pkgname}/src/${pkgname}-${pkgver}.tar.gz")
md5sums=('277f5b8365ec30297d8467ac8095a13d')

if [[ ${CARCH} == 'i686' ]]; then
    depends=('wfdb')
    makedepends=('gcc-fortran')
else
    depends=('lib32-wfdb')
    makedepends=('gcc-fortran-multilib')
fi


build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make
}

package() {
    cd "${srcdir}/${pkgbase}-${pkgver}"

    mkdir -p "${pkgdir}/usr/bin"

    make WFDBROOT="${pkgdir}/usr" install

    make check || exit 1
}

# vim:set ts=4 sw=4 et:
