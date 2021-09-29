# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: hayao  <hayao at fascode dot net>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=archlinux-appstream-data
pkgname=archlinux-appstream-data-pamac
pkgver=20210929
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
for _repo in core extra community multilib; do
 source+=($_repo-$pkgver.xml.gz::https://sources.archlinux.org/other/packages/$_pkgname/$pkgver/$_repo/Components-x86_64.xml.gz
          $_repo-icons-48x48-$pkgver.tar.gz::https://sources.archlinux.org/other/packages/$_pkgname/$pkgver/$_repo/icons-48x48.tar.gz
          $_repo-icons-64x64-$pkgver.tar.gz::https://sources.archlinux.org/other/packages/$_pkgname/$pkgver/$_repo/icons-64x64.tar.gz
          $_repo-icons-128x128-$pkgver.tar.gz::https://sources.archlinux.org/other/packages/$_pkgname/$pkgver/$_repo/icons-128x128.tar.gz)
 noextract+=($_repo.xml.gz-$pkgver $_repo-icons-{48x48,64x64,128x128}-$pkgver.tar.gz)
done
sha256sums=('32e516af6aa79720ad52a854b2d047adc437f49cef6dd3bb3ce7fda8be6c8898'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'ec754bccba9d707c041fa693561e7e665a3229e699adf6fd8d54a427b3dc5fe5'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '40f53e73f43ae78b33fadd5adb869131dde28bed7001e6a5b60b30fdb9cff9d2'
            '14934e648fc9cca6aff89243eb2f66619df6d6f014efca1b96b2572967e66e26'
            '0ef71f549b2fe25ad42f01d163eb09d68c9a07d60d3d73254e77c70d222e6cbf'
            '81ab4768734a64ec1be1190bd0eb864ea6222aa42b1abe66b54e691bc7a16b10'
            '13c046f64c7f57274c15cedaa7c2e376945c00eeecc4323ca79bbdd1d7b1eb25'
            '6b1fa73908898f065ea8d843b6bb4d1d7c558e7291d88d9b3025e170243b0b29'
            '7e6e4d3b7e5569bef0f54cbdc099cd5d105e906dc664dfb59f0e55cfce06b542'
            '6b8d591be3a2b36f23104fcc147f6dd8ee5508956c5afa6f201ea122857d3db7'
            'e447912bb09029cf58f487345b071dd9e4ab11dee81a583bc97e4ccd3cdadc22'
            '153299116a91e948f8265ca95c881d0388b5e94361a0e6adb935ccb744d36e92'
            '708b9f791b44dc3fd5e6332c7a0129a9f3a093eaa571b01f8a71ef2adb55002a'
            '0d9afe57add105ab12e6a311c0d45e9368124cce3ed24b4b42b791be9d1d3f7a')

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

