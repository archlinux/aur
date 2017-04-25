# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

_pkgname=RP-Soundboard
pkgname=teamspeak3-plugin-rp-soundboard
pkgver=1.3.3.1622
pkgrel=2
pkgdesc='Plugin for Teamspeak 3. Easy to use soundboard'
arch=('i686' 'x86_64')
url="https://github.com/MGraefe/${_pkgname}"
license=('Unknown')
makedepends=('teamspeak3-pluginsdk>=3.1.0.1' 'qt5.6')
depends=('teamspeak3>=3.1.0.1')
source=("https://github.com/MGraefe/${_pkgname}/archive/${pkgver}.tar.gz"
        'build-fixes.patch')
sha256sums=('1f7cb5436ec0a0bb61b5bfc1589412774717561e0ad1509dade419bfc1e5d5f4'
            'd23d2c5d4cc58d21593b42a5a85e207021fb4a98085fe73a29d05619fc78833b')


prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  patch -p0 -i "${srcdir}/build-fixes.patch"
  cd src/version
  python version.py
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/qt-linux"

  export TS3DIR=/opt/teamspeak3
  /opt/qt5.6/bin/qmake ts3soundboard_linux.pro

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  mkdir -pm0755 ${pkgdir} "$pkgdir/opt/teamspeak3/plugins"
  install -D -m644 bin/release_lin/librp_soundboard.so "$pkgdir/opt/teamspeak3/plugins/librp_soundboard.so"
}

# vim:set ts=2 sw=2 et:
