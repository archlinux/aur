# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pkgname="archlinux-appstream-data"
pkgname="archlinux-appstream-data-pamac"
pkgver="20200828"
pkgrel="2"
pkgdesc="Arch Linux application database for AppStream-based software centers"
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
    '210536675d09bba862e8209195589e52ba5bb164095680a2c5a9c74f99d44cd4'
    '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
    '8ac73e8357122263cdf646afe3d7fdab2a14991b5437531a0873e3600384dfbc'
    '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
    '0c6438773c72fb0eaae3564b0cc53e0fcebc11e3a89d7ac0dff244ba1eca9543'
    '30ace09ca1e89324f1330faeb5a7dafb5b7bd0481be16744f2b716aeb506d7fd'
    '2a10edf87204588842b8303d77ee4f7b19875932cce4c4e8b0b6163a2faaa5af'
    'c8e975032d1215c6e0d3fdbff7105b73adf62b65b35616d15352ffdca2b9617f'
    '8f4b4d6482946bc7861b2a46b89a16dcfebfbef3e523b6a6d5f38cccc74e2f63'
    '5afa9f21246b07df99621af893fbbf91ed457222241da0d221a2fb3cf0573b54'
    'd3f60d1c6382f71065a5512a5e623edf0231ab5efc1d98f68c5c4ebb07b1bb87'
    '07263c7b9f30df590794a4c949fe8d0dca2d4740fd70844024216f3278ccafdc'
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
