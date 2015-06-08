# Maintainer: Jonathan Lestrelin <jonathan.lestrelin@gmail.com>
# Contributor: Nate Pleasant <nate.pleasant@gmail.com>
# Contributor: Mihai Onofrei <mihai303@gmail.com>

pkgname=colout-git
_pkgname=colout
pkgver=20131109
pkgrel=1
pkgdesc="Reads text on stdin and produces colorized and stylized output"
arch=('any')
url="http://nojhan.github.com/colout/"
license=('GPL')
depends=('python')
optdepends=('python-pygments')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
_gitroot="git://github.com/nojhan/colout.git"
_gitname="colout"

build() {
	cd "$srcdir"
	msg "Performing source checkout..."
	if [ -d "$_gitname" ]; then
		cd "$_gitname"
		git pull origin || return 1
		cd ..
	else
		git clone "$_gitroot" || return 1
	fi
	msg "Source checkout finished."
}

package() {
         cd "$srcdir/$_pkgname"                                        
         python setup.py install --root="$pkgdir/" --optimize=1       
}

