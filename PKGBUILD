# Maintainer: nontlikeuname

pkgname=meson-ubuntu
_pkgname=meson
pkgver=0.41.1
pkgrel=1
pkgdesc="SCons-like build system that use python as a front-end language and Ninja as a building backend"
arch=(any)
url="http://mesonbuild.com/"
license=('Apache')
depends=('python' 'ninja')
#checkdepends=(gcc-objc gnustep-make vala rust gcc-fortran mono boost qt5-base) #gtest or googletest
provides=("${pkgname%-git}" "meson")
conflicts=("${pkgname%-git}" "meson")
source=(https://launchpad.net/ubuntu/+archive/primary/+files/meson_${pkgver}.orig.tar.gz
https://launchpad.net/ubuntu/+archive/primary/+files/meson_${pkgver}-1ubuntu2.debian.tar.xz)
sha256sums=('3d160b0514ff3d25f0a47975c6f70fd82b76c589876d10413efc5e01df43e0c2'
            '98be88a75903a0674c81f7bf6a1e882b9044e3b6330d2dc2754a0f6397d6d6f1')

prepare(){
  cd "$srcdir/${_pkgname}-${pkgver}" 
  patch -Np1 -i "$srcdir"/debian/patches/0001-Use-absolute-path-to-target-dir-within-gnome-module.patch
  patch -Np1 -i "$srcdir"/debian/patches/use-header-for-unity-builds-only.patch
}
check() {
	cd "$srcdir/${_pkgname}-${pkgver}"
#	tests require a lot of dependencies
#	./run_tests.py
}

package() {
	cd "$srcdir/${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1
	install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
