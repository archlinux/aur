# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=memocast-bin
_pkgname=${pkgname%-bin}
_filename=Memocast
pkgver=2.2.3
pkgrel=1
pkgdesc="Yet another elegant Wiz Note Client, which was built with Quasar UI Framework and based on Electron."
arch=('x86_64')
url="https://github.com/TankNee/Memocast"
license=('MIT')
depends=('electron8')
makedepends=('tar')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=("neeto-vue")
# options=('!strip')
source=("${_pkgname}-${pkgver}.deb::https://github.com/TankNee/Memocast/releases/download/v${pkgver}/${_filename}-${pkgver}-amd64-linux.deb"
        "https://raw.githubusercontent.com/TankNee/Memocast/master/LICENSE"
        "${_pkgname}.sh")
sha256sums=('135e4bed22a730004370d991b851c60d5102473f62f97eec99dfbc3e6c09d95e'
            '09141f28d3723a64b16c54cbecd3b239301c879fc2f229dd70528cf75878b812'
            '907104b1a2cb10f13def27a871147399c6d06ecaa81505d533ab5b2388e13569')

prepare() {
  mkdir -p ${srcdir}/build

  tar -xf data.tar.xz -C build
}

package() {
  cd ${srcdir}/build

  # asar 
  install -Dm644 opt/${_filename}/resources/app.asar -t ${pkgdir}/usr/lib/${_pkgname}

  # script wrapper
  install -Dm755 ${srcdir}/${_pkgname}.sh ${pkgdir}/usr/bin/${_filename}

  # desktop entry
  install -Dm644 usr/share/applications/cn.${_pkgname}.app.desktop -t ${pkgdir}/usr/share/applications/
  sed -i "s|/opt/Memocast/cn.memocast.app|Memocast|g" ${pkgdir}/usr/share/applications/cn.${_pkgname}.app.desktop

  # icon
  install -Dm644 usr/share/icons/hicolor/512x512/apps/cn.${_pkgname}.app.png -t ${pkgdir}/usr/share/icons/hicolor/512x512/apps/

  # license
  install -Dm644 ${srcdir}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}
}

# vim: set sw=2 ts=2 et:
