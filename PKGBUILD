# Maintainer:  Novikov Maxim <the.mlex@gmail.com>

pkgname=nausoftphone
_pkgname=nausoftphone6
pkgver=6.3.40.2
pkgrel=1482506341
pkgdesc="Naumen SoftPhone. Software Phone from Naumen ISC"
arch=('x86_64')
license=('Commercial')
depends=('bash' 'alsa-lib>=1.0.16' 'boost' 'bzip2' 'gcc-libs>=4.6' 'glibc>=2.16' 'hicolor-icon-theme' 'hplip' 
	'krb5>=1.10.' 'libidn>=1.13' 'libldap>=2.4.7' 'libpulse>=0.99.1' 'libtiff>=4.0.3' 'phonon-qt4>=4.2.0'
	'phonon-qt4-gstreamer' 'qt4>=4.8.0' 'qtwebkit-bin>=2.3.' 'zlib>=1.1.4'
)
optdepends=('haveged: boost low entropy')
makedepends=()
install=.INSTALL
source=(manual://nausoftphone_$pkgver-$pkgrel-trusty_amd64.deb \
	nausoftphone6.desktop \
	nauphone.png)
DLAGENTS+=('manual::/usr/bin/echo The source file for this package needs to be downloaded manually from you licence')
sha256sums=('0d58d84735c3719df5747f9f38f43c513807849b12778fb4ed49e641ec397db5'
	'SKIP'
	'SKIP')

package() {

  tar xf ${srcdir}/data.tar.xz

  # Clear
  unlink ${srcdir}/control.tar.gz
  unlink ${srcdir}/data.tar.xz
  unlink ${srcdir}/debian-binary
  unlink ${srcdir}/nausoftphone_$pkgver-$pkgrel-trusty_amd64.deb
  unlink ${srcdir}/usr/share/applications/${pkgname}.desktop
  rm -Rf ${srcdir}/usr/share/doc

  # Install
  install -d -m755 "$pkgdir"/opt/
  install -d -m755 "$pkgdir"/opt/naumen/${_pkgname}
  install -d -m755 "$pkgdir"/usr/

  cp -a ${srcdir}/opt/naumen/${pkgname}/* $pkgdir/opt/naumen/${_pkgname}
  cp -a ${srcdir}/usr/ $pkgdir/usr/

  install -D -m444 ${srcdir}/nauphone.png $pkgdir/opt/naumen/${_pkgname}/res/icons/nauphone.png
  install -D -m644 $srcdir/${_pkgname}.desktop $pkgdir/usr/share/applications/${_pkgname}.desktop
}
