# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: hayao  <hayao at fascode dot net>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=archlinux-appstream-data
pkgname=archlinux-appstream-data-pamac
pkgver=20210612
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
sha256sums=('132f42addb0e59a18446bb2fb5c499e0835f20e0903613c2d478fbcb38d8a9f1'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '18d43c45298a8cecfad762fac8d78067646db1776e096d9ae77a732623108e9b'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '8968475b029ef26b694319acf0829b180cfc117191bf17df5bd9e97c477c3464'
            '1bdad6960d1e05fdaa134b50e2aa6c9a680cd3ff8551d8d454a3aa05b9fc52cd'
            '56cad63de24209fc929b346dccd50cef366914a5c61f3ca81efd573f04d5ca55'
            '9f33d14f5eb0e4ce05e321d8d5bc963efeb624e13f8a9b772b5faba31c22b219'
            '433bbfe5349f5dcf100fc076e24b17798e59694fc1da3dae1dc882636e1b6348'
            'ed3b84c60136655549a203dc5c31858240159ca181083a2f31b6b13c52d5815b'
            '10005fe0bf381d8f04d8ab6ab890e45aeeb378fe57d41dc00e301ae0bf32a05f'
            '43f51e9c7e74dc128161047c9d68fbef8e4ae0a69df499aa6f0fde54d21846cc')

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
