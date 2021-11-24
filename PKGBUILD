# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: hayao  <hayao at fascode dot net>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=archlinux-appstream-data
pkgname=archlinux-appstream-data-pamac
pkgver=20211018
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
sha256sums=('b6f86b99824c6c84762ceb92e99f4f85f2cc27e556b61fdb0ec3b24b0fa6b4c2'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'f4afa3a40b2c7e4fc748ad51754c6c00fd3d90f6a8460a662e7f628b835a4b6d'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'c41a3dc6789dc22287ab50eca9007a3bc0acaebda34bba0e99abcfb24867a019'
            '58fd661b9527196e01e9e48fef87d93e5c0293365794e5996065c1b02751f284'
            '6a485207013368c2a9ff6dba439d0f108a53c3c96fb7cc96be3f20f77eec5cad'
            '47fef2cd539a270d29192d4e18159367ef5c1358d6f8eec6a5f54a3275107565'
            '0b8c0950062b22dd9820f5d257d2a0425d6046f4f9d4b4ab0863f3ef501bf03c'
            '8e25f73eae905801b6e092f7df8e97342c20e946dd1d1b308b6c1b0ebd75306f'
            'e35d2267dc1c46bb3e3107d2f2f3d4f80814119df5aaedc4fbbea3936d97e43e'
            'eccaa7eea07da98e1bdbce1807fbd699b2ada0a4c02933a2595bacd6c3c2198b'
            'c713668bc545c0b00a75c1ac4d982abd0e9cc1a95d73c141f6053fcc4f069387'
            'c3417a8e3ac40593d72abb655cadd2145c3cf8b6e8a3ffbc2eff5c564ddca793'
            '33958a200b4a3a7ad5748cd773e9d9728208f6e5bb3d9beae5994d9c9faf8b6a'
            'ed937b6627c5a8d0f24a64c3c5751e5e8d9a3042eb62139d6bb5ee77f25cca07')

package() {
  mkdir -p "${pkgdir}"/usr/share/app-info/{icons/archlinux-arch-{core,extra,community,multilib}/{48x48,64x64,128x128},xmls}
    for _repo in core extra community multilib; do
   tar -xzf $_repo-icons-48x48-$pkgver.tar.gz -C "$pkgdir"/usr/share/app-info/icons/archlinux-arch-$_repo/48x48
   tar -xzf $_repo-icons-64x64-$pkgver.tar.gz -C "$pkgdir"/usr/share/app-info/icons/archlinux-arch-$_repo/64x64
   tar -xzf $_repo-icons-128x128-$pkgver.tar.gz -C "$pkgdir"/usr/share/app-info/icons/archlinux-arch-$_repo/128x128
   install -m644 $_repo-$pkgver.xml.gz "$pkgdir"/usr/share/app-info/xmls/$_repo.xml.gz
   zcat "${srcdir}/${_repo}-${pkgver}.xml.gz" | sed 's|<em>||g;s|<\/em>||g;' | gzip > "${pkgdir}/usr/share/app-info/xmls/${_repo}.xml.gz"
    done
}

