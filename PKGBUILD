# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

_pkgname=RP-Soundboard
pkgname=teamspeak3-plugin-rp-soundboard
pkgver=1.3.5.1733
pkgrel=1
pkgdesc='Plugin for Teamspeak 3. Easy to use soundboard'
arch=('x86_64')
url="https://github.com/MGraefe/${_pkgname}"
license=('Unknown')
makedepends=('teamspeak3-pluginsdk>=3.1.0.1' 'qt5.6' 'python')
depends=('teamspeak3>=3.1.0.1')
source=("https://github.com/MGraefe/${_pkgname}/archive/${pkgver}.tar.gz"
        'build-fixes.patch')
sha256sums=('c83bf9a431e9e27d9b780304a9bbb0e4da258a74dcc3fc8848fa264b8f2966ca'
            '940e5c41e000df005b280693c34888fb0131953378e501ffc375ed9bd1c87953')

prepare() {
  cd "${_pkgname}-${pkgver}"

  patch -p0 -i "${srcdir}/build-fixes.patch"

  cd src/version
  python version.py
}

build() {
  cd "${_pkgname}-${pkgver}/qt-linux"

  export TS3DIR=/opt/teamspeak3
  /opt/qt5.6/bin/qmake ts3soundboard_linux.pro

  make
}

package() {
  cd "${_pkgname}-${pkgver}"

  mkdir -pm0755 ${pkgdir} "$pkgdir/opt/teamspeak3/plugins"
  install -D -m644 bin/release_lin/librp_soundboard.so "$pkgdir/opt/teamspeak3/plugins/librp_soundboard.so"
}

# vim:set ts=2 sw=2 et:
