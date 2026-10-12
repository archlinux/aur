# Maintainer: Manuel Barrio Linares <mbarriolinares at gmail dot com>
# Contributor: Leonidas P. <jpegxguy at outlook dot com>

pkgname=ksmbd-tools
pkgver=3.5.7
pkgrel=1
pkgdesc="Userspace tools for the ksmbd kernel SMB server"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/cifsd-team/ksmbd-tools"
license=('GPL-2.0-or-later')
depends=('libnl' 'glib2' 'glibc' 'gcc-libs')
provides=('samba')
makedepends=('meson' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('43f18da02499f3dd2c021255b95aa127e83254997502fcdcccb34053461effd1')

build() {
  cd "${pkgname}-${pkgver}"
  arch-meson build --prefix=/usr --sbindir=/usr/bin --libexecdir=/usr/lib/${pkgname} --sysconfdir=/etc -Drundir=/run
  meson compile -C build
}

package() {
	DESTDIR="${pkgdir}" ninja -C "${pkgname}-${pkgver}/build" install
}
