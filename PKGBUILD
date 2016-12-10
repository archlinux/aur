# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributer: Ebrahim Byagowi <ebrahim@gnu.org>

pkgname=ttf-iran-nastaliq
pkgver=r14.891dc4f
pkgrel=1
epoch=1
pkgdesc="A free Unicode calligraphic Persian font."
arch=('any')
url="https://github.com/font-store/font-IranNastaliq"
license=('OFL')
groups=(persian-fonts)
depends=('fontconfig' 'xorg-font-utils')
makedepends=('git')
install=$pkgname.install
source=("${pkgname}::git+https://github.com/font-store/font-IranNastaliq.git")
md5sums=('SKIP')

pkgver() {
	cd $srcdir/$pkgname
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
    cd $srcdir/$pkgname 
    install -d $pkgdir/usr/share/fonts/$pkgname
    cp -a ./old/*.ttf $pkgdir/usr/share/fonts/$pkgname/
    cp -a ./WebFonts/{*.ttf,*.woff*} $pkgdir/usr/share/fonts/$pkgname
    install -Dm644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
