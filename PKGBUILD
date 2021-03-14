# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=archlinux-appstream-data
pkgname=archlinux-appstream-data-pamac
pkgver=20210218
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
sha256sums=('2c0f2047d7b80708b93c93c7179baa8910060a90d7d222ee446f4f114413d231'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '069d65d97a2915b92f054694aaa0c3989db900ae01adad459432ab0f66e617b5'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '0b3c9b172ef3eab46b53842c29bbcff137a6baf0d5cb7eadf9962642822a2bb5'
            '3cc0e7aab6e83300b6b72f8b52aaa274e20b4f996733a884a5de42e423359928'
            '06b139e9762b90e1fbc2f5f009a28317314a72e87b2be7cb3742455b20985461'
            'f5ad7bc172a4665843d625997361e23336dd8e1088a0a418bb2f72141ed32c5d'
            '666edacf43deb5df1a48eb056c9f188c8fcfc6fb85f709d91bbbbac7c95f4015'
            '9f49ba5b77de815eae0855d5c5fdeaba7358affb1251c387e3f819d59788c27a'
            '5f2eb2ad9f2d1f4abf49a6b2685d23c540ad308aa092e4ce80efc3dfb266f5c6'
            'f94d84c63cccc6ac6819fb58f62e6107b8095076b73da5495692e02249c1c50a')

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
