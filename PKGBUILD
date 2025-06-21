
# Maintainer : mdevlamynck <matthias.devlamynck@mailoo.org>

pkgname=fortune-mod-mlp
_gitname=ponysay
_gitrepo=https://github.com/erkin/ponysay.git
pkgver=3.0.3.36.g00b8c84d
pkgrel=1
pkgdesc="Fortune quotes from My Little Pony Friendship is Magic. Quotes come from ponysay."
arch=('any')
license=('GPL3')
url='https://github.com/erkin/ponysay'
depends=('fortune-mod')
source=("git+${_gitrepo}")
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_gitname}
	git describe|sed "s/-/./g"
}

build()
{
	cd "${srcdir}/${_gitname}"
	cd extras/fortune-mod-mlp
	chmod u+x name-pony.sh
	make
}

package()
{
    cd "${srcdir}/${_gitname}/extras/fortune-mod-mlp"
	install -dm755 ${pkgdir}/usr/share/fortune
	install -m755 pony* ${pkgdir}/usr/share/fortune
}

