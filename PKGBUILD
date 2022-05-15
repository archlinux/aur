# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: hayao  <hayao at fascode dot net>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=archlinux-appstream-data
pkgname=archlinux-appstream-data-pamac
pkgver=20220512
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
sha256sums=('390aa4ace6b614cfcc6218db8e2d31395eea003e72f954ae20948b3c943c64fa'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'e76b67bfcb57bef6b74d52e7428a41eb5567f20c877b337ced1c886eafb7b431'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '37d1a2aa521ac002e74471419ebc06a1ecba52c41dad871e2ce2487ad277ce36'
            'e319605b39dd43f4568dd829b1032130c442d1587935096f5bde42ea419b1685'
            '66e05343d84f392410ac92e0806cf2277efb52b1e2d309f259a9f0f3112bfab7'
            'b991772094bb3e410dbd0b7290c9605cc417b3991ffb883f8347476207844725'
            '56623049a2e1b2cbe81350d9611b3f13bc7dc8b2e94c9e1b525d8454c3680f82'
            '39c9e1f40f6be83d3c023924d856148f1d8ba1c18d8d36a7535628c876b14851'
            '0071097e5d6bd65db08498aef24516e5031d3e255699c0a096174b326cc9e0fd'
            'c0e19dfe58b5964ca0acaf3db654e8f9f599cd751e4d2758f95f0599e3284dde'
            '46ab63b2587abc11604c30ecec74fdf2dd987f0231347e89d9e24af00ef32bd8'
            '2aa44e7d79cb0ba8ce7e19f643bd0da9e0b4cadb476dcdd6a05586df76f53535'
            '742280d329127a46cf7e939d6ef4cf7f093cc7000299cb13edfe183cda7c98b8'
            '3ee505af3f244fa1593f97cc5eb472e747406c17a881b3c9490e2fb31f5fb5d6')

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

