# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: hayao  <hayao at fascode dot net>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=archlinux-appstream-data
pkgname=archlinux-appstream-data-pamac
pkgver=20230421
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
sha256sums=('d64802bbb69438a5c36864da9bf68e1b5154b32ac3b9a6820f257e4b5b8bd110'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '57ebee607bc2f7d8777cc15eecf75379c8c5a215bd4b5318255d8d7319542c70'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '50e7362467799067ad4ee2b1a2d9e63824d5c50337e92b1e897e49e3eb143f36'
            '5742b8befc35549d76e01f4b89ce088c8cb81f1df0602e7b092a7faf9d749b5c'
            'ae1e0a78b4919a6633c944bb309da5121079f9433b3f4dfc0ad0935f482e3898'
            'b4eabdd33623e8dce78bbcf526b6183fcdaa91a70d19747f94effc6382d1679b'
            '7f01b09e93ce267f9889da1338d23f8182243b0fdfcae6cc1723ab0549104ff3'
            '55c4c080d96dc2ffd4c31293fafff16380a9a018f66559b773a9d624a252e351'
            'b3a397b5c4291a5f5a37f59323161afe2b33f48bb51f25d342064e822c7e4173'
            '5dee8d591514f155511c987abcc503ab8b05c6dcb7ef30420c78b5eff3ba2f39'
            '369fbfcc43c0714a4b3c00dc8d35675d8419e3844a69094de568204a4faecd53'
            '7b40ecc1b77fd9e32e299f587ec53a7bdd52676ab35dcde7e3c38f83e9e910fd'
            '49c2572b3b8ec94227807a82be09e910df1016cfb7b1663dc9eada5ae599e324'
            'fa9b2d7e21cffaca71c033e1bdd104a416c58bad73b782151353aa4030780a68')

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

