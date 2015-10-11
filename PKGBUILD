# Maintainer: Tom < reztho at archlinux dot us >
pkgname=mate-tweak-git 
pkgver=3.5.2a.r0.8df794d
pkgrel=1
pkgdesc="Mate desktop configuration tool"
arch=('any')
url="https://bitbucket.org/ubuntu-mate/mate-tweak"
license=('GPL')
depends=('python' 'wmctrl' 'python-configobj' 'python-gobject')
makedepends=('git' 'python-setuptools' 'python-distutils-extra') 
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('mate-tweak::git+https://bitbucket.org/ubuntu-mate/mate-tweak.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1

    cd "$pkgdir"
    sed -i 's@/usr/bin/python2@/usr/bin/python@' usr/bin/mate-tweak
}
