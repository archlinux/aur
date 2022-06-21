# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: hayao  <hayao at fascode dot net>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=archlinux-appstream-data
pkgname=archlinux-appstream-data-pamac
pkgver=20220618
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
sha256sums=('bd264e8bb6c6534d9f3b4fe28b5f7ba5f631ad2a7ceab6fb799b3ad20fd69b75'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '423c8a14d347c078570e21cac8f7326180abaa476d394579fe0e54592f03d0c5'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '28250c01e2e1f578c5664434a777c99f388ac6cc8d0e8e2fba6d178bc5c94334'
            'd8b9040aa3465bdae512170b434de1268c0a01e66cb155e44343a71b1173bb29'
            'b48e9de2da51c629cdf78a7e320fe1fdf33a9d6e9caefba585c1e2f95f934500'
            '64d42adffe581812b55a3d472de3df0584b9a76ba25a136ccb9bdf1728d8bd96'
            'b7c5d0ff9cb63324fd1e11c41133cbb9798ab72b5333d29fba42f81b769dff6c'
            '8f70332eec54b4e8fe64763a91b9be28b7791b2f56456037df0c4577c92302f1'
            'cf63889bda852164299b9e315df8c5ec34dbd08980337d48e9cff09308f5f403'
            '3ed149b3564bca5b3b7324fbcdab57d695d04fc43e3ad7440663adc746d78369'
            '0984b84ae677ff7a748729f4b267a89cce9cd5e5607dbafabbc4ef6a9f0dfbe0'
            '52e59c6a328250147c9ca5fac206bfa47919439226b432c9f4c55ee0e379b5ef'
            '5d5d9fd656b1e21399fc085f89efea9b2e8311e4f38f0a3b187c339fa5231537'
            'b90fceb5b83be7f29bbedcafb3caaf8249c6088ca57bb73257263c370ce7f0bc')

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

