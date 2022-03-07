# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: hayao  <hayao at fascode dot net>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=archlinux-appstream-data
pkgname=archlinux-appstream-data-pamac
pkgver=20220211
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
sha256sums=('cf0d955b219cb45299f75fec19ef9c86fb9c365cc93bb4b078f84b8abe24183b'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'c3d90b3c06d6036c0875c20c30167f22734b10e2940789b84d8994077f89a5b0'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'e33233dd0641e87690aeac6f01fdca06a50638d2944b728b542825a202f20a22'
            '16affd1b7bb5b558275f9b168b2fd1ec4a7077ef5e5ef53b12ce167148e3a18e'
            'bc8f00f049d05ea12c4b667b19adaa6e5ceea0044b8bfe35729f6a1d3706d6ec'
            '307446c1087bdf5c763166c5189bee122a3ce525047f5354a260d62a3b4c14c3'
            'afe0bf087b7864248381a133de8a21ee0441557c93388207c0ce78fda9e33b8b'
            '32c186f2744584f0e769bd85026c5993c33387364f019e740e0d86354b0451a8'
            '38b70c91e31592a811b63271abd82f91338040429a6aab8b5b84d8b685273dca'
            '0acbe28997b6a0f77c302b457dc1cab6822aae40c56996f8e1fcc5c4faae438d'
            '286adc5fc2a166cf3ce10e005f311cec565bce77ef8a8e93909dc567531ae636'
            '184cb81f842859ae1219b65447b01b62fd6a0eb4af2fea2af2b3b497a132f4c7'
            'e23dd593029b978491c335eff80f77bd5a19a81d95587c70de7fa3e109e71bc0'
            '249a8a14b5c5b046ed7348d9b7ef4587f433a794a92852ac54d7576d442be13b')

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

