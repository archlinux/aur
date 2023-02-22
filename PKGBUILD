# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: hayao  <hayao at fascode dot net>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=archlinux-appstream-data
pkgname=archlinux-appstream-data-pamac
pkgver=20230220
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
sha256sums=('49833fcd3018cad795c89c8eff6da53ba09cfb03eee63a62534cf438d9fc134e'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '52011b7fb69fab0ee12199996f39edbacecce500187dc5c0fa83c6ebd9727d49'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            '08acfe3a7474cfcf4d71aceba56388a01aff310ab044f2852d6fda5cb0424400'
            'cc80c2d01c8bdc9666659252984cefea687316f6a741c32aa767ebd28c813d55'
            '2886c4434604149003fa0ffe80380fb394fcabff151429cde9df58a04ecf81f3'
            'f0ba8d3aa65d7fa95f12a40c92569dc6e75da332cb4a4a9ee06acc9f7962f4d5'
            '0a510c70b8f71393a62dfaffeee3d6e8d7baefcadd304ce9f0e717f2d94618f9'
            'dfc8fbb5e9996b6f5ea16a5c0c7262d73d79f0514e3185b6d632c02b5c48d67a'
            '71abb68bf7517f98c9b050a70cdc73ca0d80727e7b14e7a47da3d3300df0fac3'
            '0c8db631445906c97a4aa37c2f4e2949a48106a7d3a645f0ad560df1772b1d75'
            '5d911c282ef341df8a4070e7986fbc9f9d5c315ab971bc0f1d6e51fa9e790b5b'
            'bcae5b549572d48b776efcf7b4081fc9bb4efe642012ed2c4789d5d854070aef'
            '722bb2c8196e39057abc273944387e4c6380848488d28ae0bcc0a61c02e5b094'
            '44759b0d136eec5adc8d68fb104954bb521776bed416a67ce931a7a3a4a206ba')

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

