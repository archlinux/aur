# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

_pkgname=RP-Soundboard
pkgname=teamspeak3-plugin-rp-soundboard
pkgver=1.3.3.1622
pkgrel=1
pkgdesc='Plugin for Teamspeak 3. Easy to use soundboard'
arch=('i686' 'x86_64')
url="https://github.com/MGraefe/${_pkgname}"
license=('Unknown')
makedepends=('teamspeak3-pluginsdk>=3.1.0.1')
depends=('teamspeak3>=3.1.0.1')
source=("https://github.com/MGraefe/${_pkgname}/archive/${pkgver}.tar.gz"
        'build-fixes.patch')
sha256sums=('1f7cb5436ec0a0bb61b5bfc1589412774717561e0ad1509dade419bfc1e5d5f4'
            '7560d100663d570eb2bc6f3c8f2f26b6837f6ceb9d585937d23fc15b70e3392b')


prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  patch -p0 -i "${srcdir}/build-fixes.patch"
  cd src/version
  python version.py
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/qt-linux"

  export TS3DIR=/opt/teamspeak3
  qmake ts3soundboard_linux.pro

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  mkdir -pm0755 ${pkgdir} "$pkgdir/opt/teamspeak3/plugins"
  install -D -m644 bin/release_lin/librp_soundboard.so "$pkgdir/opt/teamspeak3/plugins/librp_soundboard.so"
}

# vim:set ts=2 sw=2 et:
