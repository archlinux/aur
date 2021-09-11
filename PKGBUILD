# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: hayao  <hayao at fascode dot net>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=archlinux-appstream-data
pkgname=archlinux-appstream-data-pamac
pkgver=20210921
pkgrel=1
pkgdesc="Arch Linux application database for AppStream-based software centers (Fixed for pamac-aur and pamac-all packages)"
arch=("any")
url="https://www.archlinux.org"
license=("GPL")
depends=()
makedepends=()
source=()
noextract=()
conflicts=(${_pkgname})
provides=(${_pkgname})
for _repo in "core" "extra" "community"; do
    source+=(
        "${_repo}-${pkgver}.xml.gz::https://sources.archlinux.org/other/packages/${_pkgname}/${pkgver}/${_repo}/Components-x86_64.xml.gz"
        "${_repo}-icons-48x48-${pkgver}.tar.gz::https://sources.archlinux.org/other/packages/${_pkgname}/${pkgver}/${_repo}/icons-48x48.tar.gz"
        "${_repo}-icons-64x64-${pkgver}.tar.gz::https://sources.archlinux.org/other/packages/${_pkgname}/${pkgver}/${_repo}/icons-64x64.tar.gz"
        "${_repo}-icons-128x128-${pkgver}.tar.gz::https://sources.archlinux.org/other/packages/${_pkgname}/${pkgver}/${_repo}/icons-128x128.tar.gz"
    )
    noextract+=("${_repo}.xml.gz-${pkgver}" "${_repo}-icons-{48x48,64x64,128x128}-${pkgver}.tar.gz")
done
sha256sums=('53392bb74b1d91c55e72e0e0ade88e65c904fc80b4a0fe44460c7eb59ec0dc19'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'a893b4bdbe43aaa18a08d7c0a58054a4a6b1b8e687f3863b96dddc987e9dbf91'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'cb91e22850c9792b3f4a4f378015dd1bef1ef0544b6d99199c5da368c021665b'
            '76e50920c0e223bfb5528c9dda26126f0e478474fd76aac0013d4be70a9310b4'
            '257c094f4abd6d895defac864a9e908b01cfc61928cd674e2648585c208ce55d'
            '389391e4a79bf45018606e97c92f66ad227c3c6cc5dfda02b7a95c59478fad67'
            '1d943c369a8fa45a17668bd226fa07fd4616c0dd3e0576b4e2aec86e95ee4c21'
            'bd329d080073f8b496d5c0b9d7555dd4cb780fb80e3d00befd2a696862f46ab5'
            'd5e37fcd358d2d5ef8e6a03c3cd202a2a238a54390e5f2e7a62bb7cfc28ab3f9'
            '3d63e0b70fb00f9a4b3d661b2638718a1ca7d4377294d0708322fac2285c492a')

package() {
  mkdir -p "${pkgdir}"/usr/share/app-info/{icons/archlinux-arch-{core,extra,community}/{48x48,64x64,128x128},xmls}
    for _repo in "core" "extra" "community"; do
        tar -xzf "${_repo}-icons-48x48-${pkgver}.tar.gz" -C "${pkgdir}/usr/share/app-info/icons/archlinux-arch-${_repo}/48x48"
        tar -xzf "${_repo}-icons-64x64-${pkgver}.tar.gz" -C "${pkgdir}/usr/share/app-info/icons/archlinux-arch-${_repo}/64x64"
        tar -xzf "${_repo}-icons-128x128-${pkgver}.tar.gz" -C "${pkgdir}/usr/share/app-info/icons/archlinux-arch-${_repo}/128x128"
        #install -m644 ${_repo}-${pkgver}.xml.gz "$pkgdir"/usr/share/app-info/xmls/${_repo}.xml.gz

        #zcat /usr/share/app-info/xmls/community.xml.gz | sed 's|<em>||g;s|<\/em>||g;' | gzip > "new.xml.gz"
        zcat "${srcdir}/${_repo}-${pkgver}.xml.gz" | sed 's|<em>||g;s|<\/em>||g;' | gzip > "${pkgdir}/usr/share/app-info/xmls/${_repo}.xml.gz"
    done
}
