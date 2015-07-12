# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Konrad <konrad AT knauber DOT name>
# Contributor: Luka Perkov <archlinux <at> lukaperkov <dOt> net>
# Contributor: Fernando M <f <at> beford.net>
# Author: Wintershade <Wintershade AT google mail DOT com>

pkgname=yasem-git
_pkgname=yasem
pkgver=0.1
_pkgver=$pkgver
pkgrel=19
pkgdesc="IPTV STB emulator"
arch=('i686' 'x86_64' 'armv7h')
url=("https://github.com/mvasilchuk/yasem")
license=('GPL2')
depends=('qt5-base>=5.2' 'qt5-webkit>=5.2' 'ffmpeg' 'portaudio')
makedepends=('gcc>=4.3' 'git')
optdepends=(
  'openal: OpenAL support'
  'smbclient: SAMBA support'
  'cifs-utils: SAMBA support'
  'qca-qt5: Wi-Fi/LAN remote controls support for MAG2xx devices'
)

source=("git://github.com/mvasilchuk/yasem.git")
md5sums=('SKIP')

build() {
	cd "${srcdir}/${_pkgname}"
	git submodule update --init --recursive
	git submodule foreach --recursive git submodule update --init 
	qmake
	make
}

package() {
        mkdir -p "${pkgdir}/opt/${_pkgname}" "${pkgdir}/usr/bin"
	install -d "${pkgdir}/opt/${_pkgname}/bin"
	cp -r ${srcdir}/${_pkgname}/bin ${pkgdir}/opt/${_pkgname}/
	ln -s "/opt/${_pkgname}/bin/yasem" "${pkgdir}/usr/bin/yasem"
}
