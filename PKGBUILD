# Maintainer: Sam S. <smls75@gmail.com>
# Original submitter: Yann Kaiser <kaiser.yann@gmail.com>

pkgname=bittriprunner
pkgver=1.0.4+h20120927
_hibver=1.0-4
_buildver=1348702546
pkgrel=1
pkgdesc="BIT.TRIP RUNNER, a rhythm-based action platformer"
url="http://bittripgame.com/bittrip-runner.html"
arch=('i686' 'x86_64')
license=('custom')
depends=('sdl' 'libgl' 'openal' 'libvorbis')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

source=('bittriprunner.desktop')
md5sums=('bf61637b0bbd771f19bcec3b2c76438c')

source_i686+=("hib://bit.trip.runner-linux-${_hibver}_i386-${_buildver}.tar.gz")
md5sums_i686+=('900019b5994e1b8b2e08fcf07d9c1c08')

source_x86_64+=("hib://bit.trip.runner_${_hibver}_amd64-${_buildver}.tar.gz")
md5sums_x86_64+=('026712ac29972467f0b167a3eeaa3933')

_archive_subdir="bit.trip.runner-1.0";
_installname="bittriprunner"

package() {
  cd $srcdir

  # Install game files
  mkdir -p "${pkgdir}/opt/${_installname}"
  cp -r "${_archive_subdir}/bit.trip.runner"/* "${pkgdir}/opt/${_installname}/"

  # Install launcher script
  echo -e "#!/bin/sh\ncd /opt/${_installname} && ./bit.trip.runner" \
        > "launcher.sh"
  install -Dm755 "launcher.sh" "${pkgdir}/usr/bin/${_installname}"

  # Install icon
  install -Dm644 "${_archive_subdir}/bit.trip.runner/RUNNER.png" \
                 "${pkgdir}/usr/share/pixmaps/${_installname}.png"

  # Install desktop entry
  install -Dm644 "${pkgname}.desktop" \
                 "${pkgdir}/usr/share/applications/${_installname}.desktop"

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${_installname}"
  cp -r "${_archive_subdir}/README"* "${pkgdir}/usr/share/doc/${_installname}"
}
