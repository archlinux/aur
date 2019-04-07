# Maintainer: Hannes Kirsman <hkirsman at gmail dot com>

pkgname=gmuxbacklight-git
pkgver=r9.9df3036
pkgrel=1
pkgdesc="Deepin gmux backlight fix"
arch=('x86_64')
license=('GPL')
makedepends=('git')
source=("${pkgname}::git+https://github.com/AlexWoroschilow/GmuxBacklight.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/$pkgname" || exit
    install -d $pkgdir/etc/gmux/
    cp gmux_* $pkgdir/etc/gmux/
    install -d $pkgdir/etc/udev/rules.d/
    cp 80-gmux.rules $pkgdir/etc/udev/rules.d/
}
