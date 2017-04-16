# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

_pkgname=ts3client-notification-plugin
pkgname=teamspeak3-plugin-notification
pkgver=1.0.2
pkgrel=1
pkgdesc='Plugin for Teamspeak 3. Sends simple desktop notifications when being mentioned or receiving private messages'
arch=('i686' 'x86_64')
url="https://github.com/svenpaulsen/${_pkgname}"
license=('Unknown')
makedepends=('teamspeak3-pluginsdk>=3.1.0.1')
depends=('teamspeak3>=3.1.0.1')
source=("https://github.com/svenpaulsen/${_pkgname}/archive/${pkgver}.tar.gz"
        'change_include.patch')
sha256sums=('096970a906f35a7faa8c0856aec7c5a49d072c040418e97c8e123e51c60f2309'
            'ffbec2a3845be56f04f4e029c113d980523b249d397525764d9d66dda7342755')


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
  install -D -m644 libnotification_plugin.so.${pkgver} "$pkgdir/opt/teamspeak3/plugins/libnotification_plugin.so"
}

# vim:set ts=2 sw=2 et:
