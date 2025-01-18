# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=zsh-manydots-magic
pkgver=r11
_commit=4372de0718714046f0c7ef87b43fc0a598896af6
pkgrel=2
pkgdesc="zsh zle tweak for emulating \`...'==\`../..', etc."
arch=('any')
url='https://github.com/knu/zsh-manydots-magic'
license=('BSD-2-Clause')
depends=('zsh')
makedepends=('git')
source=("git+https://github.com/knu/${pkgname%-git}.git#commit=$_commit"
        'https://github.com/twang817/zsh-manydots-magic/commit/6525d31436fd3ea9ca0de877c7dccc5763f41e46.patch')
sha256sums=('SKIP'
            'e7fb525d7774b380a402355c5b3332f8f8761ecad3cd8ad94a22dda21f67c5d1')

prepare() {
  cd "$pkgname"
  # Fix https://github.com/knu/zsh-manydots-magic/issues/2#issuecomment-1042564240
  patch -p1 -i "$srcdir/6525d31436fd3ea9ca0de877c7dccc5763f41e46.patch"
}

package() {
  install -Dm644 ${pkgname%-git}/manydots-magic -t "$pkgdir/usr/share/zsh/functions/Zle"
  install -Dm644 ${pkgname%-git}/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
