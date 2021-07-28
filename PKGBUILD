# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: hayao  <hayao at fascode dot net>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=archlinux-appstream-data
pkgname=archlinux-appstream-data-pamac
pkgver=20210723
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
sha256sums=('4815150a1fd2ba9d34a191fa5dd1fff65565dfe0bba110acf274b539b48dcb50'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'c3550c2fc31b2c87d0bfdb939c54679ddf9116a288f31d1e5c0991694c9a59d8'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '9a2b6f7b90b1ca02a1527b36d3b6c6aece05ff64862ee6c324ca50b0203b56fb'
            'c86750738671dfe0900f6f65df239d40654447a4268d7474a4457ea49f3c5378'
            'df1ba610656fecbf2f53830d521f6bbc709c1307a7402937772a74c83591ea1b'
            '760d4172691303647734fe8fd477048c8eabe5c8d6430f29039b5b6de6784b17'
            'd4fc888d4151a1c9ca5bf06f7cddbef15b7c846ec2f51b7abdde6b5b2cba0664'
            'e2c1bb647a65ec3b44fe0b4a0cc49aba7c1caac92c7664d9b2e7ad593815e1d3'
            'f7786175296a83a0610bba51ac6103077f32d29905043208d598150d2c18b5c4'
            'f7b158a2ac1b0c5028424057577a32587c6f1d02c4ea964b1a0b44882c454ee7')

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
