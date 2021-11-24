# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: hayao  <hayao at fascode dot net>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=archlinux-appstream-data
pkgname=archlinux-appstream-data-pamac
pkgver=20211122
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
sha256sums=('403b48c3f01f3cbff82971716f535b7ac5d628ac4c237bc171f609881ac8eff3'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '03495a52bebd2f4d671e72b0f4397ce5d82dda74775e03c31d9ca369cdcf16dd'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '7314181a1c06b0dc8d9048f4704272855f78af33781ca23def848b77b2e4254d'
            'f28cdfff01f386b4b4aba6d9ad3a0fc042b5625993c752ddffd06349554610ad'
            'aafae2dc257d018c9dcbce3db935421736056047f712be61be9a8ccb185782d0'
            'd159fde53badc784adb3b02458afec41307eca1032ac2e1a522814cc0a57c969'
            'de80d7d9c9fe705d59d986d26cbc3368e841386f9eacdf73281b5654541b0a26'
            '9d089a8a9f2a7e3424766fc1f4d37ea7f9f5414e7b232bf8c19a47e2a20e58df'
            'e3ddedfbbb3311eb08654aa177c73eec6aae71a1322dcb25c0f1361e50fff410'
            'c7e35088e60a7b3ac8bf904a88564065808a6eba5e7488aedaaa5e908966669a'
            '6b44eb95c334eb41f97343331345142744f4fa3a82217a64c67fa371d913b5e9'
            '889eeb6a666c92a216b6ef9559e4dc6cd54b397f89d874abfceae487de394c66'
            'f1ad7bb2f561d0a71e4453251d81410a02ea5a461feef7bcf82c389437b11c83'
            'aeebd212f035503e18bd4e4523da9a1ffe443156f6bce3751c20ff2872c1eda8')

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

