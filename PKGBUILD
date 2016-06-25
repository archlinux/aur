# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: M.Carreira <manuel@carreira.com.pt>

pkgname=buffer
pkgver=1.19
pkgrel=8
pkgdesc="Speed up writing tapes on remote tape drives"
arch=('i686' 'x86_64')
url="http://www.hello-penguin.com/software.htm"
license=('GPL')
source=("http://www.hello-penguin.com/software/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "01-debian-patches.all"
        "02-fedora-patch.all"
	"${pkgname}-${pkgver}.tar.gz.sig"
	"01-debian-patches.all.sig"
	"02-fedora-patch.all.sig")
sha512sums=('4a53163991f2e56e81c7cbd180edbbae9e15bb7a522fa946c1ca351fb85b3e4f4ca6ac4afd3cde852cc407099921e29739d7e30c39b568a75b4be696e1f3e8eb'
            '1e58d06f27766198c465f42afd4555ac52ddf01305ca60d1c3c6c6b9580de37d2092d7f4daf0054cfd4e9af3857ec756b50e53b2b57fd3717dff03e7fa05da69'
            '99463d849f5a4c2522cc0e9ac42e080104db57479192ce7d580993d1279cd48540616b482b3ea789bfa3100fb4d179ba9f0290b8ef3c51e3a9587fe9a4afce09'
            'SKIP'
            'SKIP'
            'SKIP')


prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 <${srcdir}/01-debian-patches.all
  patch -p1 <${srcdir}/02-fedora-patch.all
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -p -m 755 -D buffer ${pkgdir}/usr/bin/buffer
  install -p -m 644 -D buffer.man ${pkgdir}/usr/share/man/man1/buffer.1
}
