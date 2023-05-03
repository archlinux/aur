# Maintainer: Yngve Levinsen <yngve.levinsen@ess.eu>

pkgname=pyorbit-git
pkgver=3.0
pkgrel=1
pkgdesc="Accelerator Optics simulation code"
url="https://gitlab.esss.lu.se"
license=('MIT')
depends=('python' 'fftw' 'gcc-libs' 'glibc' 'openmpi')
provides=('pyorbit')
makedepends=('git')
arch=('i686' 'x86_64')
source=("git+https://gitlab.esss.lu.se/andreishishlo/pyorbit.git"
        "pyorbit.sh")
sha256sums=('SKIP'
            '3fa7cda28609f94e73dc9275be116d64ba93169271985403943d4c57267eebfe')

#pkgver() {
#    cd pyorbit
#    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
#    #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

build() {
    cd $srcdir/pyorbit
    source setupEnvironment.sh
    rm environment.yml
    make clean
    make
}

package() {
    install -D -m755 pyorbit.sh ${pkgdir}/usr/bin/pyorbit
    install -D -m755 ${srcdir}/pyorbit/bin/pyORBIT3 ${pkgdir}/usr/bin/pyORBIT3
    install -dD ${srcdir}/pyorbit/py ${pkgdir}/usr/share/pyorbit/lib/python/
    cp -r ${srcdir}/pyorbit/py/orbit ${pkgdir}/usr/share/pyorbit/lib/python/
}
