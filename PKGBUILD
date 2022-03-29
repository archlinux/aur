# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: hayao  <hayao at fascode dot net>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=archlinux-appstream-data
pkgname=archlinux-appstream-data-pamac
pkgver=20220327
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
sha256sums=('a61a9751586541428bd0223a0ddd4e9f6475e1ce496f4105979144c9b9c99f1c'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '451f8c7b86500721b9b067e47de6b89df0f9b300c1010dcdb8baa737ea32b0c6'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'f990d6fb8cf287b6d142c92e3d67f39e352d128a69203dc9f5d9b8b705ba2bbb'
            '8ad170a9ba57378ffccb46e80dee74113b0f2cf90727f36270f47a2f3af011e9'
            'bee7b7a313da988b99c47d6a7fdc4225640b6b50b8959f68ac7520748bb1de52'
            '4c8f044743bf0f8a5e45edbc647de1ac85471ef20ab961520c0c31c5fb427847'
            'aca5d8b6583340872e6df97b034d1a8756ef184c278b00959262dccdc5762266'
            '6bdd496f7a259fea914b0dd18a9d2ff4e3f392eeeb0e3692b00aea0958d7159d'
            'ca82a466375385c01d5baf3ae93b030cf06135d5b245d895ac92b0f360a54a87'
            'ca57b67f1870ab405022bfd5c24341eae81bd4ce1e672c2337f302ec68b4b311'
            '5aa12a6f776bd48a8294f0eabb3da1443bc4a340a9ae0b486152262236c72c2c'
            'b558f00e4fbb6269e7cc85e41e84bb077302a47f0814c841f18503117b5912a9'
            '35e10d6f44028bd9f5863389cbb5efa5cbd8679c6d9e2e7b869bde21b0159dd4'
            'a6c962378bd7c56f897a0238f1d2fa37c6ebe827aa7c7444c9c2a8d7d26beb99')

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

