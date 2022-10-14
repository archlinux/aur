# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: hayao  <hayao at fascode dot net>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=archlinux-appstream-data
pkgname=archlinux-appstream-data-pamac
pkgver=20221014
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
sha256sums=('79c6b959666166be3eb2c87962cecff1078d3fd8bdb55dcc76028790e9072947'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '4c10bce7fdaa806c3be89a41a2274e45d626a20fb4b9c3a45441f621f45546c3'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '9c950375292ba98a51fb51d46939b4a76b9261044bf8f258480ca6c08a1d71b3'
            'fad8657c86cc8bdfa4505f747b63129b1e50915c954a336dbcb8bb69a8731c1c'
            '53ee20fc4dc305fc1286969d484e4b4b4e748f60e1333bcfbbffef7da45c0690'
            '538a01009e14823b700ab44e68825e420b27777f9eb970a274d47e6b25c02656'
            '1f3932e543e565d75bb310a508f1eadc67e4e4ac26fd6b45a382890556926b93'
            '1d1cf4c2e25facc346f5559fc5cf61910ee93c322acccb768ccaa529366e9749'
            '81df52942a05f47d2390f4bf2440ee4faa4c3f414026d46814d9b0045d531563'
            'd2e9617c596c9347d40392e54e0e8faad6904a0bd88f8d705ed520395a3377b1'
            '39b450ca0e57757f34a313a305c3c28f6f0320d296235c7eb86c89222cd4b8ef'
            '557f002d5c7ac14de5b3f268086a47a62371f39029a7d06c4afbab071f9c2c81'
            '34cea2cca48a9c372d5a1f62debdd78465b6b718e5d852f952fe4467ea00f4cc'
            '5347c08e4ec02635534e0ecdf36fe17fe4a116828724ea2759ab2bf56c63877f')

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

