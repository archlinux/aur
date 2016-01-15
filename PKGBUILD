# Maintainer: Janne Heß <jannehess@gmail.com>

# Contributor: Janne Heß <jannehess@gmail.com>

pkgname=python2-libzfs-git
pkgver=89d28d7
pkgrel=1
pkgdesc='Python CFFI bindings for libzfs'
url='https://github.com/Xaroth/libzfs-python'
license=('MIT')
depends=('python2-cffi' 'python2-enum34')
makedepends=('gcc')
source=('git://github.com/kelleyk/libzfs-python')
sha256sums=('SKIP')
arch=('i386' 'x86_64')

pkgver() {
	cd "${srcdir}/libzfs-python"
	git describe --always
}

package() {
	cd "${srcdir}/libzfs-python"
	python2 setup.py install --root="${pkgdir}/" --optimize=1
	# WTF These comments contain absolute paths
	sed -i 's/^# .*$//g' "${pkgdir}/usr/lib/python2.7/site-packages/libzfs/bindings/output/headers.h.in"
}

