# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=mmseqs2-bin
_pkgname=mmseqs
_tag=18-8cc5c
pkgver=18_8cc5c
pkgrel=2
pkgdesc="Ultra fast and sensitive sequence search and clustering suite"
arch=('x86_64')
url="https://github.com/soedinglab/mmseqs2"
license=('MIT')
depends=()
provides=("mmseqs2=${pkgver}")
conflicts=('mmseqs2')
options=('!strip' '!debug')
source=("${url}/releases/download/${_tag}/mmseqs-linux-avx2.tar.gz")
sha256sums=('bd9b0234da5949ad528d5b5f9ea4cda9c1e23dce14b46c0791d4d919a76e61ce')

# Upstream ships a statically-linked binary (ldd: not a dynamic executable).
# The tarball keeps substitution matrices in ../matrices relative to bin/,
# which mmseqs resolves through its own real path, so that layout is
# preserved under /usr/share/mmseqs and /usr/bin/mmseqs is a symlink to it.
# Default matrices are embedded in the binary; the files only matter for
# explicit --sub-mat lookups.

package() {
    install -Dm755 "${srcdir}/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/share/mmseqs/bin/${_pkgname}"
    install -dm755 "${pkgdir}/usr/share/mmseqs/matrices"
    install -m644 "${srcdir}/${_pkgname}/matrices/"*.out "${pkgdir}/usr/share/mmseqs/matrices/"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/share/mmseqs/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
