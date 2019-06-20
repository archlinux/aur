# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

_pkgname=ts3client-notification-plugin
pkgname=teamspeak3-plugin-notification
pkgver=1.0.7
pkgrel=1
pkgdesc='Plugin for Teamspeak 3. Sends simple desktop notifications when being mentioned or receiving private messages'
arch=('i686' 'x86_64')
url="https://github.com/svenpaulsen/${_pkgname}"
license=('Unknown')
makedepends=('teamspeak3-pluginsdk>=3.3.0' 'qt5-base')
depends=('teamspeak3>=3.3.0')
source=("https://github.com/svenpaulsen/${_pkgname}/archive/${pkgver}.tar.gz"
        'change_include.patch')
sha256sums=('765affaadc68f38c2668aeb7804c0302e138fa507f1ef8d9f7ae70dd42347bc7'
            'cc951ea1fe2066981046e886c555d557f1b3656ed997a6226890a350b298c009')


prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  patch -p0 -i "${srcdir}/change_include.patch"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  qmake plugin.pro
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  mkdir -pm0755 ${pkgdir} "$pkgdir/opt/teamspeak3/plugins"
  install -D -m644 libnotification_plugin.so "$pkgdir/opt/teamspeak3/plugins/libnotification_plugin.so"
}

# vim:set ts=2 sw=2 et:
