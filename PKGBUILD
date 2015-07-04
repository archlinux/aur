# Maintainer: Scott Lawrence <bytbox@gmail.com>

# Forked from pommed. Previous header:
# Maintainer: Corrado Primier <ilbardo gmail com>
# Contributor: Other contributors existed but lost information
# Contributor: dpevp <daniel.plaza.espi@gmail.com>
# Contributor: jordi Cerdan (jcerdan) <jcerdan@tecob.com>

pkgname=pommed-light
pkgver=1.47lw
pkgrel=1
pkgdesc="Handles the hotkeys of Apple MacBook (Pro) laptops - lightweight edition"
arch=('i686' 'x86_64')
url="https://github.com/bytbox/pommed-light"
license=('GPL2')
install=$pkgname.install
makedepends=('pkgconfig')
depends=('alsa-lib' 'confuse' 'audiofile' 'pciutils')
conflicts=('pommed')
optdepends=('eject: disc ejection support')
source=(https://github.com/bytbox/${pkgname}/archive/v${pkgver}.tar.gz pommed.service)
dfname="${pkgname}-${pkgver}"
md5sums=('36b21b215b17577c561439bc76fd00ef'
         'fd5be6c0aa9ac4a0b1b628a23361b4cf')

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
