# This file is part of BlackArch Linux ( https://www.blackarch.org/ ).
# See COPYING for license details.

pkgname=quartz-utils-bin
_project=quartz-utils
pkgver=0.0.2
pkgrel=1
utils=('url2host')
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
            '635cf6fc232488c0a4e4d494a8647aca13c9fce2b62b6870de3af0a683fd0b51269b9d2507a1579a69fcfc2fe81eb065221e9b596dc189606d6766020cb4f19e')
b2sums=('0e3f5e604e1afdab730145369a243eca302e20e74d6cc43c19d04592934bd465b15f074c56bc26c611898dea363fa247fa1732f37d076bb38a92d64badf0d1ba'
        '437b18fd772b312403607dc90547e0c883541f9b5dcd0744b8d60c0f84a791d4bcb74dfcc3fe73a0f95a9349e29276d2ab45d888c993f5d042f5642ea6bc879e')
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
