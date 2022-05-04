# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: hayao  <hayao at fascode dot net>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=archlinux-appstream-data
pkgname=archlinux-appstream-data-pamac
pkgver=20220422
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
sha256sums=('5484bffdc28bb3ffa08b09ffdca86c29eb2d19695f49b93932d65fa3e1da3522'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'f84be0c7decd26cdeffd3400671cb577307a1100e94aa432fd595cd41767cb52'
            '7989bb311baa38ef545250282aa065d23281c46dfb8faabe4c653487bdbded5c'
            'a9333ea49c84e892e5d2d9b465414e90cfa88734b7de394e5114a4208a9a3eb5'
            '6acb97045db8664b52a8d7d31afd0cff20ab64e0acb2730b450f499ec50f3606'
            '9ada25392b2bf6b80c0bb963d4c42aef18f612486af53b94352403a8444e936e'
            '8e65728043e113c4697624aa5c0aa15bd3a4f0a4b58c11f7e186c5c57fd29ed5'
            'c75753047a64e10d86759ebb416c0b6020faaf7984e8353683ea7293bd909a59'
            'c45d7442c009f6b13d372f6c7f840e29a877f1c29f3acfd2bf6c52222c779b73'
            'fa0ee56377d08dcb578d94a3e01c36d0abbf907d087339c4f1f7d0fc0324f1f2'
            '5e317e47cbd7a09446fc7c3b0854cd3c0697f7fb4c9ad36b296dccc4653d61bd'
            '6acdf64dd34cd52f5a1c7ae7f60b4c4123406a186a4126266c7a2e8d42d0a32a'
            '2a95ac19a2e344c0b62456b3359dea264cfd6e2614531d304ab1b4514e7e7024'
            '0e4ddad547b8d3d5d81dcc7afb57620b794878c8fe894e4c767e8821f416ec5e'
            '587faf5c9bab8664c8548334f1fb9d02612923312df41da565af5a6d972edaa3')

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

