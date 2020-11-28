# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pkgname="archlinux-appstream-data"
pkgname="archlinux-appstream-data-pamac"
pkgver="20201020"
pkgrel="1"
pkgdesc="Arch Linux application database for AppStream-based software centers (Fixed for pamac)"
arch=("any")
url="https://www.archlinux.org"
license=("GPL")
depends=()
makedepends=()
source=()
noextract=()
conflicts=("${_pkgname}")
provides=("${_pkgname}")
for _repo in "core" "extra" "community"; do
    source+=(
        ${_repo}-${pkgver}.xml.gz::https://sources.archlinux.org/other/packages/${_pkgname}/${pkgver}/${_repo}/Components-x86_64.xml.gz
        ${_repo}-icons-48x48-${pkgver}.tar.gz::https://sources.archlinux.org/other/packages/${_pkgname}/${pkgver}/${_repo}/icons-48x48.tar.gz
        ${_repo}-icons-64x64-${pkgver}.tar.gz::https://sources.archlinux.org/other/packages/${_pkgname}/${pkgver}/${_repo}/icons-64x64.tar.gz
        ${_repo}-icons-128x128-${pkgver}.tar.gz::https://sources.archlinux.org/other/packages/${_pkgname}/${pkgver}/${_repo}/icons-128x128.tar.gz
    )
    noextract+=("${_repo}.xml.gz-${pkgver}" ${_repo}-icons-{48x48,64x64,128x128}-${pkgver}.tar.gz)
done
sha256sums=(
    '1ea18f23a03efe933230b7c3ec6b851efcdb567b5a5f6c986c080f2c51354bec'
    '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
    'bef2363e0fa68db52563223aa5ea48baae1400f533bc6d0e532953847c15fbe4'
    '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
    'b4c89c3af8cba3d54c11f9a707d68f2b95fd4ca0030033d2138413d1adb33c28'
    '26f2dc39bb43bb5fd95bf0c186e0c90e990bef4cea5349f3a23a709e3e1229e4'
    '576bde9ad84c272e1c154791266bb675008e715e7aff41343b42cc91651e49f9'
    'ff7e3afb209db68f7362997f5ec5ad9150de779b23e1c969546ebda70be9e7f2'
    '26552ebc0031350e0edd9953bfda821067edd0621f108a07407f50683598cea6'
    '2abe9485f92b14aca730b4733845bee90bc226ea4fadc7c88e522777e8ac472e'
    '329fd72433af51e89ab01da4efb3de9d24e03b7098f37c6e088b7300c112117e'
    'f6780c67c400acb1309e9c17e763b2a33898e9bc04ad7f270c6b573073c105de'
)

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
