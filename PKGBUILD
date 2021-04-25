# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: hayao  <hayao at fascode dot net>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=archlinux-appstream-data
pkgname=archlinux-appstream-data-pamac
pkgver=20210423
pkgrel=1
pkgdesc="Arch Linux application database for AppStream-based software centers (Fixed for pamac)"
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
sha256sums=('2424613bc56d0cd2c2e415cfb7a1bc7bafd0a4736d1797b969e82c9a2804bdc7'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'cae055295fc974e9fecf73ae52bd69f7583f163ba43e6a4d92d5d4c49e9f15e7'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '47da7355fc37539a8820a6e803d509fb02cba38476383fd1dc654c20756cf027'
            '4e4b09d764e2f2ee1871adcb13143de707fe386e3e90bc7639ce4bea98ee9629'
            '1fe29ea9360be240c8df18166e1b520ba903ddec2a0cb8c1fbb9db15ad239cf1'
            '86b983020f2a16e3512f712a4339fe43628a5b0d3f5602c5fc60fd3408020a31'
            '8cfde641cbeaf44db327e98887f73722e102db9857510db43339f3b4c816618f'
            '22adb64be941243de225d5906958b06cb341609c0a11977f082217fc460d6023'
            '5016ddd48f3e94d6e0124c3d7f37e5cc70a9bae62e44a3596c13cdf60b0b1ce2'
            '9684737853fad8a928f285b281e1561fa8dc3467374410eb6f3e1915c5154c65')

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
