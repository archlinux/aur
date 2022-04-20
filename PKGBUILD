# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>

pkgname=esoreflex
pkgver=2.11.5
pkgrel=2
pkgdesc="EsoReflex is an environment that provides an easy and flexible way to reduce VLT/VLTI science data using the ESO pipelines. "
url="https://www.eso.org/sci/software/esoreflex/"
arch=('x86_64')
license=('GPL3')
depends=('java-environment' 'libxtst')
makedepends=()
# Note all of them needs to be installed for interactivity to work, but conda environments 
# can also alternatively be used to set it up
# See https://www.eso.org/sci/observing/phase2/Using_conda_w_esoreflex.html
optdepends=('python-astropy: enables interactivity with system-wide python installation'
            'python-matplotlib: enables interactivity with system-wide python installation'
            'python-wxpython: enables interactivity with system-wide python installation')
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=(https://ftp.eso.org/pub/dfs/reflex/esoreflex-${pkgver}.tar.gz
        esoreflex.sysusers
        esoreflex.sh
        esoreflex.patch)
md5sums=('8754d013b6e9c9cef40439c7e4560b6b'
        SKIP
        SKIP
        SKIP)
install=esoreflex.install

prepare() {

    cd ${srcdir}/${pkgname}-${pkgver}
    patch --forward --strip=1 --input=${srcdir}/esoreflex.patch

}

package() {

    mkdir -p ${pkgdir}/opt/esoreflex
    cp -aR ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/opt/esoreflex/
	
    install -D -m755 ${srcdir}/${pkgname}-${pkgver}/esoreflex/bin/esoreflex ${pkgdir}/usr/bin/esoreflex
    mkdir -p ${pkgdir}/opt/esoreflex/esoreflex/python/__pycache__/
    chmod g+w -R ${pkgdir}/opt/esoreflex/esoreflex/python/__pycache__/
    chmod g+w -R ${pkgdir}/opt/esoreflex/build-area

    install -Dm644 ${srcdir}/${pkgname}.sysusers ${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf
    install -Dm644 ${srcdir}/${pkgname}.sh ${pkgdir}/etc/profile.d/${pkgname}.sh

}

# vim:set ts=4 sw=4 et:
