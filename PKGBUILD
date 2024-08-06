# This file is part of BlackArch Linux ( https://www.blackarch.org/ ).
# See COPYING for license details.

pkgname=quartz-utils-bin
_project=quartz-utils
pkgver=0.0.3
pkgrel=1
utils=('url2host' 'stripansi')
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
            'df5a389c6c3bfd7148b551ba6bae44eeeb6efcc70f8936c68979083d428e8f28962301768ddd3da90fb19fc26d57c8e177525012407b9ba3939361fe174d34e6')
b2sums=('0e3f5e604e1afdab730145369a243eca302e20e74d6cc43c19d04592934bd465b15f074c56bc26c611898dea363fa247fa1732f37d076bb38a92d64badf0d1ba'
        'ec58f8d808d34b9278d80469e24b73bf86d1ef47aabb2a8b1343cbd25889a5328289f94f48896e588419aa36bacc6448ce658027b1f6d21a22ecbd6934eee6b9'
        'f2a00a66a5c2f299b655adb7288843d6bebe2a514c293cf8cea9e20fea15f87369668555dee037f166577f8b26e2a06d499e6d6ec76009f964507fa3df230849')
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
