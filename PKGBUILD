# Maintainer: Martin Kröning <m dot kroening at hotmail dot de>
pkgname=make-fmv-patch-git
pkgver=r21.831ace4
pkgrel=2
pkgdesc='Make FMV patch generator'
arch=('any')
url="https://github.com/clearlinux/${pkgname%-git}"
license=('MIT')
depends=('perl' 'ctags')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/clearlinux/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
        cd "$srcdir/${pkgname%-git}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
        cd "$srcdir/${pkgname%-git}/tests"
        make distclean all

        cd "$srcdir/${pkgname%-git}"
        [[ -n "$(perl make-fmv-patch.pl tests/loop-build.log tests)" ]]
        [[ -n "$(perl make-fmv-patch.pl tests/max-build.log tests)" ]]
}

package() {
        cd "$srcdir/${pkgname%-git}"
        install -Dm755 make-fmv-patch.pl "$pkgdir/usr/bin/make-fmv-patch"
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
