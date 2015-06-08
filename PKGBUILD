# Maintainer: Miroslav Koskar (http://mkoskar.com/)

_basename='tcolors'
_pkgbuildver=1

pkgname='tcolors-git'
pkgver="r0.0.$_pkgbuildver"
pkgrel=1
pkgdesc='Get & Set terminal ANSI colors'
url='https://github.com/mkoskar/tcolors'
license=('BSD 2-Clause')
arch=('any')
depends=('python')
makedepends=('git')

source=("git+https://github.com/mkoskar/$_basename.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_basename"
    printf 'r%s.%s.%s' "$(git rev-list --count HEAD)" \
                       "$(git rev-parse --short HEAD)" \
                       "$_pkgbuildver"
}

package() {
    cd "$srcdir/$_basename"

    install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -d -m 755 "$pkgdir"/usr/bin
    install -m 755 bin/tcolors.py "$pkgdir"/usr/bin
    install -m 755 bin/tcolors-gtk "$pkgdir"/usr/bin
    install -m 755 bin/tcolorsinfo "$pkgdir"/usr/bin
    install -m 755 bin/tcolorsinfo8 "$pkgdir"/usr/bin

    ln -s tcolors.py "$pkgdir"/usr/bin/tcolors
}
