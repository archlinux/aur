# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pkgname="archlinux-appstream-data"
pkgname="archlinux-appstream-data-pamac"
pkgver="20201223"
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
        "${_repo}-${pkgver}.xml.gz::https://sources.archlinux.org/other/packages/${_pkgname}/${pkgver}/${_repo}/Components-x86_64.xml.gz"
        "${_repo}-icons-48x48-${pkgver}.tar.gz::https://sources.archlinux.org/other/packages/${_pkgname}/${pkgver}/${_repo}/icons-48x48.tar.gz"
        "${_repo}-icons-64x64-${pkgver}.tar.gz::https://sources.archlinux.org/other/packages/${_pkgname}/${pkgver}/${_repo}/icons-64x64.tar.gz"
        "${_repo}-icons-128x128-${pkgver}.tar.gz::https://sources.archlinux.org/other/packages/${_pkgname}/${pkgver}/${_repo}/icons-128x128.tar.gz"
    )
    noextract+=("${_repo}.xml.gz-${pkgver}" "${_repo}-icons-{48x48,64x64,128x128}-${pkgver}.tar.gz")
done
sha256sums=(
    'b8cdc0ca1500beff530578b804e9deb20f508762394a53492aecbf7fdd0956cf'
    '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
    'ec8d9be072e6547365e436bf352367527fb3f7cc17ed5073787db29b84b422bc'
    '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
    '5ab9dc9552a933bb4f69b84839e36a85e2d05ef84548e276bfae9258c9aa9315'
    '51f749144166b9d4b7a82cd5c0e6929e014074550b1e6027e6bc486cab3ad9e3'
    'f6050c1e868a14db18045a008b9f686f55ebe183b0169172258a55e6d9c5edb4'
    'a8f06d9d5d9f307c2cb039f0f43d57f59eda0fc5e739820f8a8cee0b47f97bb0'
    'e268aadaddcd490dbd45da1eff46d6540c66d2dfa012dc33ddc0fd07453c1673'
    '7a3d36d4106f3e27565d302e173bbdb60c55297de2d4eb453596511cd3a71b15'
    'd28cb3af851caf27b7cad681fae799c6ee34f39894e829e3aa7a6401129a6db6'
    '3a2aba6bc381ba1e45be301a97c6c746fd70b1207150796fc6c28c1e9a89932b'
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
