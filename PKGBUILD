# Maintainer: Lucki <Lucki holarse-linuxgaming de
# Contributor: Nikos Kouremenos <nkourAATTfreemail.gr>

pkgname=londonlaw-git
pkgver=0.3.0_pre2.r1.g35d419f
pkgrel=2
pkgdesc="Clone of the famous Scotland Yard board game with network support."
arch=('any')
url="https://github.com/anyc/londonlaw"
license=('GPL2')
changelog=.CHANGELOG
depends=('python2' 'python2-twisted' 'wxpython' 'python2-zope-interface')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(${pkgname%-git}::git+https://github.com/anyc/londonlaw.git)
sha512sums=('SKIP')

pkgver()
{
	cd "${srcdir}/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
	# update .CHANGELOG
	git -C "${srcdir}/${pkgname%-git}" log --graph -10 > "${startdir}/.CHANGELOG"
}

package()
{
	cd "${srcdir}/${pkgname%-git}"
	python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
	
	# https://lists.archlinux.org/pipermail/aur-general/2011-November/016777.html
	mkdir -p "${pkgdir}/usr/share/doc/${pkgname%-git}"
	cp -dpr --no-preserve=ownership "doc/." "${pkgdir}/usr/share/doc/${pkgname%-git}"
}
