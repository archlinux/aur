# Maintainer: Lucki <Lucki holarse-linuxgaming de
# Contributor: Nikos Kouremenos <nkourAATTfreemail.gr>

pkgname=londonlaw-git
_pkgname=londonlaw
pkgver=0.3.0_pre2.r1.g35d419f
pkgrel=1
pkgdesc="Clone of the famous Scotland Yard board game with network support."
arch=('any')
url="https://github.com/anyc/londonlaw"
license=('GPL2')
changelog=.CHANGELOG
depends=('python2' 'python2-twisted' 'wxpython' 'python2-zope-interface')
provides=('londonlaw')
conflicts=('londonlaw')
source=(${_pkgname}::git+https://github.com/anyc/londonlaw.git)
sha512sums=('SKIP')

pkgver()
{
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
	# update .CHANGELOG
	git -C "${srcdir}/${_pkgname}" log --graph -10 > "${startdir}/.CHANGELOG"
}

package()
{
	cd "${srcdir}/${_pkgname}"
	python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
	cp -r "${srcdir}/${_pkgname}/doc" "${pkgdir}/usr/share/"
}
