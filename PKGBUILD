# Maintainer: Jiachen Yang <farseerfc@gmail.com>
# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: naxuroqa <naxuroqa at gmail.com>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: Kevin MacMartin <prurigro at gmail dot com>

pkgname=toxcore-static2
_pkgname=c-toxcore
epoch=1
pkgver=0.2.2
pkgrel=1
pkgdesc='Secure, configuration-free, P2P Skype replacement backend'
arch=('x86_64')
url='https://tox.chat'
license=('GPL3')
depends=('libsodium' 'libvpx' 'opus')
makedepends=('check' 'cmake')
conflicts=()
provides=()
backup=()
install=
source=(
	"${_pkgname}-v${pkgver}.tar.gz::https://github.com/TokTok/${_pkgname}/archive/v${pkgver}.tar.gz"
	#"${_pkgname}-v${pkgver}.tar.gz::https://github.com/TokTok/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"
	#"${_pkgname}-v${pkgver}.tar.lz::https://github.com/TokTok/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.tar.lz"
	#"${_pkgname}-v${pkgver}.tar.lz.asc::https://github.com/TokTok/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.tar.lz.asc"
	#"pr504.patch::https://github.com/TokTok/c-toxcore/commit/d4414ffa3acf9e7ab5158e6c7a69c115ccb1a308.patch"
        )
sha512sums=('6fda4b60edfa70660dc355d507c86fcdbe1af137d62b4601aa39b6248b4519087c0e76f69075bcddbc42c363dc38a7cbdb78720caa7a289330124c23f5e63c18'
                                 )


prepare() {
  cd $_pkgname-$pkgver
}

build() {
  cd $_pkgname-$pkgver
  #autoreconf -if
  #./configure \
  #  --prefix=/usr \
  #  --enable-daemon \
  #  --disable-ntox \
  #  --enable-tests
  cmake -DCMAKE_INSTALL_PREFIX=/opt/toxcore-static2 \
        -DDHT_BOOTSTRAP=off \
        -DBOOTSTRAP_DAEMON=off \
        -DBUILD_NTOX=off \
        -DBUILD_TOXAV=on \
        -DENABLE_STATIC=on \
        -DENABLE_SHARED=off \
        -DBUILD_AV_TEST=off
  make
}

check() {
  cd $_pkgname-$pkgver
  #make check
  # make test ## test fail on i686 
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  # install -Dm644 "$srcdir/toxcore.conf" "$pkgdir/usr/lib/sysusers.d/toxcore.conf"
  # install -Dm644 ./other/bootstrap_daemon/tox-bootstrapd.service "$pkgdir/usr/lib/systemd/system/tox-bootstrapd.service"
  # install -Dm644 ./other/bootstrap_daemon/tox-bootstrapd.conf "$pkgdir/etc/tox-bootstrapd.conf"
}
