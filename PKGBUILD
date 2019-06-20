# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

_pkgname=RP-Soundboard
pkgname=teamspeak3-plugin-rp-soundboard
pkgver=1.4.1.1810
pkgrel=1
pkgdesc='Plugin for Teamspeak 3. Easy to use soundboard'
arch=('x86_64')
url="https://github.com/MGraefe/${_pkgname}"
license=('Unknown')
makedepends=('teamspeak3-pluginsdk>=3.3.0' 'python' 'qt5-base' 'ffmpeg')
depends=('teamspeak3>=3.3.0')
source=("https://github.com/MGraefe/${_pkgname}/archive/${pkgver}.tar.gz"
        'build-fixes.patch')
sha256sums=('af00598fdfada9bc3f8000824b572236c0be6db51398600f869cdf1a88ea5064'
            '8cbfe1d695c5c3477e6c28a649c29575d82720c30c48a74de0c8162ade05efbc')

prepare() {
  cd "${_pkgname}-${pkgver}"

  patch -p0 -i "${srcdir}/build-fixes.patch"

  cd src/version
  python version.py
}

build() {
  cd "${_pkgname}-${pkgver}/qt-linux"

  export TS3DIR=/opt/teamspeak3
  qmake ts3soundboard_linux.pro

  make
}

package() {
  cd "${_pkgname}-${pkgver}"

  mkdir -pm0755 ${pkgdir} "$pkgdir/opt/teamspeak3/plugins"
  install -D -m644 bin/release_lin/librp_soundboard.so "$pkgdir/opt/teamspeak3/plugins/librp_soundboard.so"
}

# vim:set ts=2 sw=2 et:
