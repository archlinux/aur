# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: hayao  <hayao at fascode dot net>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=archlinux-appstream-data
pkgname=archlinux-appstream-data-pamac
pkgver=20220727
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
sha256sums=('10f38da399db1ad1ffd0d613b270cc31cb7fda274a5df48de84202d7095e5024'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'c21726d2193e9431433257035573d1e86b2c30633e9cb0aa3a276c2ca3d95543'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'a9f8273b76540cfde13c12b6e2ea5ab8130dbd9dcffc40e29c8280993c508d7f'
            '8d3a9e1bedca60ec05c58678bf26e36396e35ebd6373caadd79929137122b302'
            '4df52a5fec36e3b665238e6ee7b52b43a4f00a93fd0cce631360921fb44f738f'
            'd450057fa0186627f4305ce0b906e5cb7619cae45a9970df10c3dedcb9a345e7'
            'b2a02d88be59867b4436b50d53b95ddd58802614deb49d6d2b2280fdb3818ad3'
            'f4218119434467da926dd1f1a4a422fee9068aba4c8eaed39280270d53783fa0'
            'fc8d3ea80ccc5cc4184d3406f6dbf68ca4adc932a4e07a0ce5b072a64fb169a1'
            '7faea334f440e4f69ce3ebf5b45364417e19f192e0ebc548cb7ae2018179be23'
            '5653a6e257ba606ce1415bc2524999f46d723114d4f7d0501ed088fd1df9e584'
            'f9666a520d16b4e59ad151bf946c77cdf7ab374d61e52808108ee1c33b3e55c7'
            '84b8d3a89676212025a2a161596d09be356f4531d9abc0d7d824a7ce7d9015c7'
            '13fb38dcb0fd072c57fb46ebc87ea05e9793f63d9e8e9d78374ad5fa6a4d1642')

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

