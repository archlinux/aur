pkgname=eastl
pkgname_=EASTL
pkgver=3.12.01
pkgrel=1
pkgdesc="Electronic Arts Standard Template Library. It is an extensive and robust implementation that has an emphasis on high performance."
arch=(any)
url="https://github.com/electronicarts/EASTL"
license=("BSD", "other")
depends=()
makedepends=("cmake")
source=("https://github.com/electronicarts/EASTL/archive/${pkgver}.tar.gz")
sha384sums=("68defff99706f975158d2ae19c1889831eab2df39619c22193c08a98db2928d48c11a82ff9e3d8cde11de7e6529397e7")

build() {
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -B"${srcdir}/${pkgname_}-${pkgver}" \
        -H"${srcdir}/${pkgname_}-${pkgver}"
  cmake --build "${srcdir}/${pkgname_}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" -C "${srcdir}/${pkgname_}-${pkgver}" install
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname_}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname_}-${pkgver}/3RDPARTYLICENSES.TXT" "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
