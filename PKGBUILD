# Maintainer: Ash <xash at riseup d0t net>

pkgname=async-profiler-bin
_pkgname=async-profiler
pkgver=4.2.1
pkgrel=1
pkgdesc='Sampling CPU and HEAP profiler for Java featuring AsyncGetCallTrace + perf_events (prebuilt binaries)'
arch=('x86_64')
url='https://github.com/async-profiler/async-profiler'
license=('Apache')
depends=('java-environment')
provides=('async-profiler')
conflicts=('async-profiler')
options=('!strip')

source=("https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/async-profiler-${pkgver}-linux-x64.tar.gz")
sha256sums=('SKIP')

package() {
    cd "${_pkgname}-${pkgver}-linux-x64"

    # upstream layout
    install -d "${pkgdir}/opt/async-profiler"
    cp -a --no-preserve=ownership . "${pkgdir}/opt/async-profiler/"

    # binaries
    install -d "${pkgdir}/usr/bin"
    ln -sf /opt/async-profiler/bin/asprof "${pkgdir}/usr/bin/asprof"
    ln -sf /opt/async-profiler/bin/jfrconv "${pkgdir}/usr/bin/jfrconv"

    # shared library
    install -d "${pkgdir}/usr/lib"
    ln -sf /opt/async-profiler/lib/libasyncProfiler.so \
        "${pkgdir}/usr/lib/libasyncProfiler.so"

    # headers
    install -d "${pkgdir}/usr/include"
    ln -sf /opt/async-profiler/include/asprof.h \
        "${pkgdir}/usr/include/asprof.h"

    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
