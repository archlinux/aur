# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: hayao  <hayao at fascode dot net>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=archlinux-appstream-data
pkgname=archlinux-appstream-data-pamac
pkgver=20220830
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
sha256sums=('b0b2301626eb678d627d0fec811132da445f8fabb4f02c8b673453feb8b803f4'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '91b04f1fa526629e70e0644156d8c56a46817700267f878e9d7305567ebf45c3'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'a4c882dd9e7c365c81212280076783e329ea22edd972a4ed542f80b6a31741d8'
            '7d2d17bfac3d319984082f2f1496218e98ec74182fbd53e785d0ab08baa393a9'
            '5bb38ff41ad2936d1925a14185c7a0892fabb0146dbd6cc1e1fd2ab1d6d2f7ac'
            'ed20899b133dc5f76d6b6613f50d7d1587f03f2eb3515827afe8fb27b6199bac'
            'bb40afce94a7787e5b4e3d9ce684538ea387a3f0d13d6ec2112026b608f8453e'
            '7464e8e78166953301e171ff4b5b02ef64c39d1302e0e2523b016067d7d3aafa'
            '9d273e426b4a39e9210a60a17f95ed71433e0731029b9e44810e81ddcc272a2b'
            '660aa465c4cd8e2af9b9fadb57e64b435ffd4a425ce2a2f246eabe168b7f3df3'
            '5001df8f4f59f932e774bce17bfb1e5787c9f63c77927abf1578a0e79fa488ac'
            '20d4580e16f2c6bc53cb48dc726e96026bde4454165034fc81b184ea44e64faf'
            '260132c6575454f4c70f3019543238285d52bc759a0d1c0a8646bea91e0c35f7'
            'cd82363aa331e7381231e6f6074be87f225eb55436d0a89babb5fe9a3ced4d32')

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

