# Maintainer: Bruce Zhang <zy183525594@163.com>
pkgname=intel-power-gadget
_pkgalias=power_gadget
pkgver=2.5
pkgrel=3
epoch=
pkgdesc="Intel Power Gadget Linux Version"
arch=('x86_64' 'x86')
url="https://software.intel.com/en-us/articles/intel-power-gadget-20"
license=('custom')
groups=()
depends=('glibc')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://software.intel.com/sites/default/files/powergadget.tgz")
noextract=()
md5sums=("995fc50d0c495e1b8ba1a88855fdb26b")
validpgpkeys=()

prepare() {
        cd "$srcdir/$_pkgalias"
        sed -i 's|rapl_lib_static:|rapl_lib_static: rapl_lib_shared|' Makefile
        sed -i 's|power_gadget_static:|power_gadget_static: rapl_lib_static|' Makefile
}

build() {
	cd "$srcdir/$_pkgalias"
	make
}

package() {
	cd "$srcdir/$_pkgalias"
	mkdir -p "$pkgdir/usr/lib/"
        mkdir -p "$pkgdir/usr/bin/"
	install -m755 librapl.so "$pkgdir/usr/lib/"
        install -m644 msr.o "$pkgdir/usr/lib/"
        install -m644 cpuid.o "$pkgdir/usr/lib/"
        install -m644 rapl.o "$pkgdir/usr/lib/"
        install -m755 power_gadget "$pkgdir/usr/bin/"
}
