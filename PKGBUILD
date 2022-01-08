# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: hayao  <hayao at fascode dot net>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=archlinux-appstream-data
pkgname=archlinux-appstream-data-pamac
pkgver=20220107
pkgrel=1
epoch=1
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
for _repo in core extra community multilib; do
 source+=($_repo-$pkgver.xml.gz::https://sources.archlinux.org/other/packages/$_pkgname/$pkgver/$_repo/Components-x86_64.xml.gz
          $_repo-icons-48x48-$pkgver.tar.gz::https://sources.archlinux.org/other/packages/$_pkgname/$pkgver/$_repo/icons-48x48.tar.gz
          $_repo-icons-64x64-$pkgver.tar.gz::https://sources.archlinux.org/other/packages/$_pkgname/$pkgver/$_repo/icons-64x64.tar.gz
          $_repo-icons-128x128-$pkgver.tar.gz::https://sources.archlinux.org/other/packages/$_pkgname/$pkgver/$_repo/icons-128x128.tar.gz)
 noextract+=($_repo.xml.gz-$pkgver $_repo-icons-{48x48,64x64,128x128}-$pkgver.tar.gz)
done
sha256sums=('e71367bf71b72f908975db0ae152903fb236f22c686d9fe9d8d75c462f1755b0'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'c8931ee05ff9f1cc95558b6bc1a78b05763522d3cda14c4d841041d4f653376d'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '13315f3ee4d702746bcb63f4b97e0db38b46b42f5ffd9082adc10b6b38450cea'
            'ae4cb39b6188afe1f2dcecfc9e7630e559d6dbf46b601a2d8c12a9b2a85823b4'
            '123e009c980bf899ea03f14f3141dc998f21bf1f1f8796f25799a2a6aa04a828'
            'a68056c2bbe8b1665b37f80c23e25630bf7ff01f3cf03849ca28f14468d91579'
            'cc7ab74b0f56baca32ac78dd2f1b5cdde8dae81ff813f3ef19f5d889f70b2332'
            'ce4c243a68137e56de05cd80d95cb9017809bea515c27f89b114ec74be908082'
            '4caf70e181c74dec49c8e8b968495903f66ac074baf41ec424c4cc238d33dcc6'
            '3408760644e5c84b01b613bfc0c80e75a1a15e333793b817cd1823c87c599850'
            '212011d8fe5cceee4f143df34dc18e453fbf4d0bd7c7883088642b7dab4b36e6'
            '7115e68ae9235ec13a42a77b2f09ba1a6e0dcd6164f5fb6f0e954b0b3d70f854'
            '2fe3e0e496ecefc82a04be92a2c40da61deeeb80569ce64c3a03a0ae13115517'
            '3290ffc34061ed03e9c52f3f01d6312d94992f8f22b75b834372e188264ca257')

package() {
  mkdir -p "${pkgdir}"/usr/share/app-info/{icons/archlinux-arch-{core,extra,community,multilib}/{48x48,64x64,128x128},xmls}
    for _repo in core extra community multilib; do
   tar -xzf $_repo-icons-48x48-$pkgver.tar.gz -C "$pkgdir"/usr/share/app-info/icons/archlinux-arch-$_repo/48x48
   tar -xzf $_repo-icons-64x64-$pkgver.tar.gz -C "$pkgdir"/usr/share/app-info/icons/archlinux-arch-$_repo/64x64
   tar -xzf $_repo-icons-128x128-$pkgver.tar.gz -C "$pkgdir"/usr/share/app-info/icons/archlinux-arch-$_repo/128x128
   install -m644 $_repo-$pkgver.xml.gz "$pkgdir"/usr/share/app-info/xmls/$_repo.xml.gz
   zcat "${srcdir}/${_repo}-${pkgver}.xml.gz" | sed 's|<em>||g;s|<\/em>||g;' | sed 's|<code>||g;s|<\/code>||g;'| gzip > "${pkgdir}/usr/share/app-info/xmls/${_repo}.xml.gz"
    done
}

