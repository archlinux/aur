# Maintainer: Kris Nóva <kris@nivenly.com>

pkgbase=falco-bin
pkgname=(falco-bin falco-bin-dkms)
pkgver=0.29.1
pkgrel=1
pkgdesc="Cloud native runtime security"
arch=(x86_64)
license=(Apache)
url="https://falco.org/"
license=(Apache)
source_x86_64=("https://download.falco.org/packages/bin/${arch}/falco-${pkgver}-x86_64.tar.gz")
sha256sums_x86_64=('60a7189f7d1c583b45966ea50af98ef3c3126aab52437ed1f67ef3d351034b90')

# EXAMPLE URL: https://download.falco.org/packages/bin/x86_64/falco-0.29.1-x86_64.tar.gz
# Falco 0.29.1 SHA256
# Note: This can be found by running "makepkg -g" in this directory.
#       The AUR documentation suggests "makepkg -g >> PKGBUILD"
#       makepkg -g is deprecated, use updpkgsums
# Kris Nóva PGP Key
#validpgpkeys=('F5F9B56417B7F2CAC1DEC2E372BB115B4DDD8252')
# package signature is missing

_commit=17f5df52a7d9ed6bb12d3b1768460def8439936d

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
