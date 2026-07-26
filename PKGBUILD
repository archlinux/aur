# Maintainer: jinzhongjia <mail@nvimer.org>
_commit=60aeaddfb3ecdb6a132e8da7569a6c442e6bb217

pkgname=fcitx5-themes-candlelight
pkgver=0.1.1.60aead
pkgrel=1
url='https://github.com/thep0y/fcitx5-themes-candlelight'
pkgdesc='fcitx5的简约风格皮肤——烛光'
arch=('any')
license=('MIT')
conflicts=()
provides=()
replaces=()
makedepends=('git')
source=("git+https://github.com/thep0y/fcitx5-themes-candlelight.git#commit=${_commit}")
md5sums=('SKIP')

pkgver() {
    echo "0.1.1.${_commit:0:6}"
}

package() {
    cd "$srcdir/$pkgname"
    install -dm755 "$pkgdir"/usr/share/fcitx5/themes/
    # ponytail: install every dir that has a theme.conf instead of listing the
    # themes by hand — upstream adds variants (e.g. macOS-{light,dark}-png) and
    # a hardcoded list silently drops them.
    for _theme in */theme.conf; do
        cp -r "${_theme%/theme.conf}" "$pkgdir"/usr/share/fcitx5/themes/
    done
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
