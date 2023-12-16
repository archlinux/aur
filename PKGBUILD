# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>
# https://github.com/brokenpip3/my-pkgbuilds
# Contributor: Kris Nóva <kris@nivenly.com> R.I.P.

pkgbase=falco-bin
pkgname=("falco-bin"
         "falco-bin-dkms")
pkgver=0.36.2
pkgrel=1
pkgdesc="Cloud native runtime security. Binaries and Kernel modules. (Stable)"
arch=(x86_64)
license=(Apache)
url="https://github.com/falcosecurity/falco"
license=(Apache)
# EXAMPLE URL: https://download.falco.org/packages/bin/x86_64/falco-0.29.1-x86_64.tar.gz
source_x86_64=("https://download.falco.org/packages/bin/${arch}/falco-${pkgver}-x86_64.tar.gz")
sha256sums_x86_64=('bffa2a50581d8391cfe20e09e70b260a7d48693757e4c52ffae9552c969e3400')

_commit=6.0.1+driver

package_falco-bin() {
  provides=(falco)
  conflicts=(falco)
    install -d "${pkgdir}/etc/falco"
    cp -rv falco-${pkgver}-${arch}/etc/falco/* "${pkgdir}/etc/falco"

    install -d "${pkgdir}/usr/share/falco"
    cp -rv falco-${pkgver}-${arch}/usr/share/falco/* "${pkgdir}"/usr/share/falco

    install -d "${pkgdir}/usr/bin"
    cp -rv falco-${pkgver}-${arch}/usr/bin/* "${pkgdir}/usr/bin"
}

package_falco-bin-dkms() {
  depends=(dkms linux-headers)
  provides=(falco-dkms)
  conflicts=(falco-dkms)
    install -d "${pkgdir}/usr/src/falco-${pkgver}"
    cp -rv falco-${pkgver}-${arch}/usr/src/falco-${_commit}/* "${pkgdir}/usr/src/falco-${pkgver}"
}
