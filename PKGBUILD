# Maintainer: Lucki <Lucki at holarse-linuxgaming dot de>

pkgname=gtksourceview3-lolcode
pkgver=0.1.r2.gf80e35e
pkgrel=1
pkgdesc="lolcode syntax highlight support in gtksourceview3 for gedit 3 and others"
arch=('any')
url="http://lolcode.org/"
license=('MIT')
changelog=.CHANGELOG
depends=('gtksourceview3')
makedepends=()
optdepends=( 'lci-git: lolcode commandline interpreter'
             'gedit: gtksourceview3 editor' )
provides=('gtksourceview3-lolcode')
conflicts=('gtksourceview3-lolcode')
source=('git+https://github.com/Lucki/gtksourceview3-lolcode.git')
sha512sums=('SKIP')

pkgver()
{
	cd ${srcdir}/${pkgname}
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
	# update .CHANGELOG
	git -C ${srcdir}/${pkgname} log --graph -10 > ${startdir}/.CHANGELOG
}

package()
{
	install -Dm644 ${srcdir}/${pkgname}/lolcode.lang ${pkgdir}/usr/share/gtksourceview-3.0/language-specs/lolcode.lang
	install -Dm644 ${srcdir}/${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
