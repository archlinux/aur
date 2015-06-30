# PKGBUILD created by: Gris Ge <cnfourt@gmail.com>
# PKGBUILD maintained by: Wang Chao <wangchao19890207@gmail.com>
set -x
pkgname="beaker"
pkgver="0.9.1"
pkgrel="1"
pkgdesc="Common files for beaker and client tools for beaker job maintenance."
arch=('i686' 'x86_64')
url=("https://fedorahosted.org/beaker")
license=('GPLv2')
depends=('python2' 'krb5' 'python2-distribute' 'python-kobo' 'python2-krbv' 'python2-lxml' 'python2-sphinx')
makedepends=('python2' 'docutils' 'python2-distribute' 'python-kobo' 'python2-krbv' 'python2-lxml' 'python2-sphinx')

source=("http://beaker-project.org/releases/beaker-$pkgver.tar.gz"
        "arch-python2.patch")

sha1sums=('cca0d7449551c75f070d298224c9a51a1692ce30'
'2ebc72e1c325714133b69e55ca0d49c9f22b0a2f')

build() {
	pwd
    #cd ${srcdir}/${pkgname}-${pkgver}

	patch -p0 -i arch-python2.patch
	make -C $pkgname-$pkgver clean || return $?
	PY_PREFIX="/usr" DESTDIR=${pkgdir} make -C $pkgname-$pkgver || return $?
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	PY_PREFIX="/usr" DESTDIR=${pkgdir} make install || return $?
}
