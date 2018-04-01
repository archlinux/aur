# Maintainer: Scott Lawrence <bytbox@gmail.com>

# Forked from pommed. Previous header:
# Maintainer: Corrado Primier <ilbardo gmail com>
# Contributor: Other contributors existed but lost information
# Contributor: dpevp <daniel.plaza.espi@gmail.com>
# Contributor: jordi Cerdan (jcerdan) <jcerdan@tecob.com>

pkgname=pommed-light
pkgver=1.51lw
pkgrel=2
pkgdesc="Handles the hotkeys of Apple MacBook (Pro) laptops - lightweight edition"
arch=('i686' 'x86_64')
url="https://github.com/bytbox/pommed-light"
license=('GPL2')
install=$pkgname.install
makedepends=('pkgconfig')
depends=('alsa-lib' 'pciutils' 'confuse' 'audiofile')
conflicts=('pommed')
optdepends=('eject: disc ejection support')
source=(https://github.com/bytbox/${pkgname}/archive/v${pkgver}.tar.gz pommed.service)
dfname="${pkgname}-${pkgver}"
sha256sums=('18b18a2a1b557d31c871059464123435b752615880e0fad085212f01d7099187'
            '22cc70a00e995d3f42b08b2ac5c44f7acadeaa5b8bd287863d3e51b115a1151e')

build() {
  cd ${srcdir}/${dfname}
  make pommed
}

package() {
  install -Dm755 ${srcdir}/${dfname}/pommed/pommed ${pkgdir}/usr/bin/pommed
  install -Dm644 ${srcdir}/${dfname}/pommed.conf.mactel ${pkgdir}/etc/pommed.conf.mactel
  install -Dm644 ${srcdir}/${dfname}/pommed.conf.pmac ${pkgdir}/etc/pommed.conf.pmac

  # Man page
  install -Dm644 ${srcdir}/${dfname}/pommed.1 ${pkgdir}/usr/share/man/man1/pommed.1

  # Sounds
  install -Dm644 ${srcdir}/${dfname}/pommed/data/goutte.wav ${pkgdir}/usr/share/pommed/goutte.wav
  install -Dm644 ${srcdir}/${dfname}/pommed/data/click.wav ${pkgdir}/usr/share/pommed/click.wav

  # Systemd
  install -Dm644 ${srcdir}/pommed.service ${pkgdir}/usr/lib/systemd/system/pommed.service
}

# vim:set ts=2 sw=2 et:
