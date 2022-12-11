# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: hayao  <hayao at fascode dot net>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=archlinux-appstream-data
pkgname=archlinux-appstream-data-pamac
pkgver=20221210
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
sha256sums=('9786a5bcb8f5138f3ba8700d171d7afa3cd05ab43c9c5c230619ca0c45a62450'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'abae89c159b0b25dc3ae191d2fd9286f7be19feb0c49ee3b219556cd16b11faf'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '89824fc0e67f04d93052a8502775b60516a2b3e453b793ab3573e97fa04a5de8'
            '8f3c9283184b7a74118c5171d7e44b2153465602a57a8442bf3aee7d7b9060d9'
            'fa4d915cff7a3827d277b37cd6ce29384c00bc02c2fe32642233617496564332'
            'c681c51701595124c18c8103a7648c1ab6a98a1293dd41f9f81f1e18ad90e247'
            'e27152b1f8d329192bb491b5c7ecf1710c25d02101a5474240be349eff46cf48'
            '34d67655c81408604ea5e45ba75d64d2c1851ee486ac42bf6ba2df0f173e1771'
            'ab5667df116e1b79abe97d94805ab2bcbd5e97aed581e4be1f9931b374f335c4'
            '70b0960c850f33e61a532e1f9bfe9f0cbd47c348c20c28ee30cdcdffcf5a4e69'
            'b448df9788ab06d29f8f0f8f0941af84a818005e45406c5917bea3c89d213cd8'
            'f44fcbc41ea223b671ecb6f04d51a7ed5dcc12163f90f3db92209d7b88297299'
            'a1dc7311e41557255fdb4f91424cb8e9445b9380ae91ea764734a01f6d85ebeb'
            'e34931b5ee1a210f82f88991c655bd9d83e0b326944357cb29604f8b8beb0074')

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

