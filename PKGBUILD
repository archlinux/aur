# Contributor: Francesco Colista <francesco.colista@gmail.com>
# Maintainer: Francesco Colista <francesco.colista@gmail.com>
pkgname=patchwork-git
_gitname=patchwork
pkgver=9cab078
pkgrel=1
pkgdesc="Web-based patch tracking system"
url="http://jk.ozlabs.org/projects/patchwork/"
arch=('x86' 'x86_64')
license=('GPL')
depends=('python-django' 'django-registration')
makedepends=()
install=""
source=('git://ozlabs.org/home/jk/git/patchwork')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	git describe --always | sed 's|-|.|g'
}

build() {
	cd "$srcdir/$_gitname"
}

package() {
	cd "$srcdir/$_gitname"
	mkdir -p "$pkgdir"/etc/$_gitname
	mkdir -p "$pkgdir"/usr/share/webapps/$_gitname
    for file in patchwork docs htdocs lib templates tools; do
		cp -r $file "$pkgdir"/usr/share/webapps/$_gitname
	done
	cp patchwork/settings/production.example.py "$pkgdir"/etc/$_gitname/local_settings.py
	ln -sf /etc/$_gitname/local_settings.py "$pkgdir"/usr/share/webapps/$_gitname/patchwork/settings/production.example.py
}
