# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: Diego <cdprincipe@at@gmail@dot@com>
# Contributor: Scott Horowitz <stonecrest[at]gmail[dot]com>

_pkgname=sonata
pkgname=sonata-git
pkgver=1.7.0.r11.g48f7456
pkgrel=2
pkgdesc='Elegant GTK+3 music client for MPD (Git Version)'
url='https://github.com/multani/sonata'
license=('GPL3')
arch=('i686' 'x86_64')
depends=('python>=3.2' 'python-gobject>=3.7.4' 'gtk3>=3.4' 'python-mpd2>=2.0')
makedepends=('git' 'python-setuptools')
optdepends=('python-tagpy: metadata editing support'
            'python-dbus: multimedia keys support')
conflicts=('sonata' 'sonata-svn')
provides=('sonata')
source=(git+https://github.com/multani/sonata.git)
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	# cutting off 'foo-' prefix that presents in the git tag
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package()
{
	cd "${srcdir}/${_pkgname}"
	python setup.py install --prefix=/usr --optimize 1 --root="${pkgdir}"
}
