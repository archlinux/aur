# This file is part of BlackArch Linux ( https://www.blackarch.org/ ).
# See COPYING for license details.

pkgname=quartz-utils-bin
_project=quartz-utils
pkgver=0.0.4
pkgrel=1
utils=('url2host' 'stripansi' 'crlf2lf' 'lf2crlf')
utils_url=()
for util in "${utils[@]}"; do
    utils_url+=("https://github.com/noraj/$_project/releases/download/$pkgver/$util-x86_64-linux-gnu_static")
done
pkgdesc='Everyday CLI utilities that are easily pipable.'
arch=('x86_64')
url='https://noraj.github.io/quartz-utils/'
license=('MIT')
depends=()
makedepends=()
source=("https://raw.githubusercontent.com/noraj/quartz-utils/master/LICENSE"
        "${utils_url[@]}")
sha512sums=('5c9a8fd4e21f09c43b0cc723d577b2099076e5a032fdf073967f94e350928075755e0fea33a19fde9aadd161ed8f2e87b9c95998fd4c7904559103c220606412'
            '68a9488b2c3f2bcf92f2dfdf765f24bf3bd5bf07e57480e1c52ec87d0c14d317872c6498a00962c25a78014e7d28ef8eb86ccd1130bb232ae6aef77387444648'
            'de1f9009df31f85618b71e899626bc3af889fa2367673c9121540dc2abfab56552ce6aea142f526eeb4f93e6b70d7a685562112d6828ecefc48f4a346e3d026e'
            '634ff6d17ee7efd3d1cf3ab9542dc479367c72ea07f7c73335d3ab2d4772353899b6a1cbb72b5ea36aa8561a86dcb5e1eeca57a70503071a49bcdc6c92ef161e'
            '176472d4ee47161800eaae79cd97dbeb08b37f676ba98e790d8f4951cbb93f1638723278f0babb7a1f0c3af2880026abf2edcd563c62f69c4a83a173ce117ba4')
b2sums=('0e3f5e604e1afdab730145369a243eca302e20e74d6cc43c19d04592934bd465b15f074c56bc26c611898dea363fa247fa1732f37d076bb38a92d64badf0d1ba'
        'ec58f8d808d34b9278d80469e24b73bf86d1ef47aabb2a8b1343cbd25889a5328289f94f48896e588419aa36bacc6448ce658027b1f6d21a22ecbd6934eee6b9'
        '297ef27ecb30277b8442a4a2df98480c06e654f5dd07eb0c42a11e942f1c8620ee892ddf565ad5f7513ff7189bc450913ac17c580546bfb62d3eb3d5869d63da'
        '0596dbb86964ce18cf67604f01043094a0ec4e778180037db14abd697eb5b34e597b9440f4e993caa3d7ea786af52f27394dda0b417570f154861e68dff1eb32'
        '300f4af51aa7927a4f835cc69e8683f785da991230082cf4c7a3ae45388762f1043f109f99ef3b8fc9bd635ffe02df03277e4e52fbf2b9108e577b91676ac243')
provides=('quartz-utils')
conflicts=('quartz-utils' 'quartz-utils-git')

package() {
  install -dm 755 "$pkgdir/usr/bin"

  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for util in "${utils[@]}"; do
    strip "$util-x86_64-linux-gnu_static"
    install -Dm 755 "$util-x86_64-linux-gnu_static" "$pkgdir/usr/bin/$util"
  done
}
