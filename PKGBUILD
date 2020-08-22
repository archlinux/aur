# Maintainer: Jat <chat@jat.email>

_pkgname=magewell-pro-capture
pkgname=${_pkgname}-dkms
pkgver=1.3.0.4186
pkgrel=1
pkgdesc='Driver for Magewell Pro Capture Family'
arch=('x86_64')
url='https://www.magewell.com/downloads/pro-capture#/driver/linux-x86'
license=('unknown')
conflicts=("${_pkgname}")
depends=('dkms' 'alsa-lib')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/jat001/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f2e1d8b3791f2dd6d68894145839c22017000deb23f65b0d35f43b9390ea8286')

package() {
    destdir=${pkgdir}/usr/src/${_pkgname}-${pkgver}
    cd ${_pkgname}-${pkgver}

    install -Dm644 scripts/dkms.conf src/Makefile src/ProCaptureLib_64.lib -t ${destdir}
    cp -r src/public src/sources ${destdir}

    install -Dm644 src/res/* -t ${pkgdir}/usr/share/ProCapture/res

    sed -i 's#/usr/local/share/ProCapture/src/res#/usr/share/ProCapture/res#g' scripts/ProCapture.conf
    install -Dm644 scripts/ProCapture.conf -t ${pkgdir}/usr/lib/modprobe.d
    install -Dm644 scripts/10-procatpure-event-dev.rules -t ${pkgdir}/usr/lib/udev/rules.d

    install -Dm755 bin/mwcap-control_64 ${pkgdir}/usr/bin/mwcap-control
    install -Dm755 bin/mwcap-info_64 ${pkgdir}/usr/bin/mwcap-info
}
