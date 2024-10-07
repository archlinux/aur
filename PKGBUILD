# Maintainer:  <noen>
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: DJ Lucas <dj@linuxfromscratch.org> (https://aur.archlinux.org/account/DJ_L)

pkgname=tftpgui
pkgver=3.1
pkgrel=4
pkgdesc="A TFTP server intended to run as a user initiated program, rather than a service daemon."
arch=('any')
url="https://code.google.com/p/tftpgui/"
license=('GPL-3.0-or-later')
depends=('tk' 'python>=3.2' 'authbind' 'python-pyasyncore')
makedepends=('imagemagick')
install=tftpgui.install
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${pkgname}/${pkgname}_3_1.tar"
        "tftpgui.sh"
        "tftpgui.cfg"
        "tftpgui.desktop")

package() {
  cd ${srcdir}
  _pymin=`python --version | cut -d " " -f 2 | sed 's@\..$@@'`
  install -vdm755 ${pkgdir}/usr/lib/python${_pymin}/site-packages
  cp -r ${pkgname} ${pkgdir}/usr/lib/python${_pymin}/site-packages
  install -vdm755 ${pkgdir}/usr/bin
  install -vm755 ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  install -vdm755 ${pkgdir}/usr/share/applications
  install -vm644 ${srcdir}/tftpgui.desktop ${pkgdir}/usr/share/applications
  for size in 16 24 32 48 72 96 128 256
  do
    install -vdm755 ${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps
    convert ${srcdir}/${pkgname}/TFTPicon.ico[3] -resize ${size}x${size} \
            ${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/tftpgui.png
  done
  install -vdm755 ${pkgdir}/etc
  install -vm644 ${srcdir}/tftpgui.cfg ${pkgdir}/etc/tftpgui.cfg
}
sha256sums=('3f40ac6e6dffdbf0301f7627756e1adc54257b02be9540add3db621cee3c749a'
            'a590050a511a985049758b064769bea53df03f79fad2e071f646a783bcfb7359'
            '4ad821c1d7b768b0303e48f5f747886fcf238ebcd99ca575b2c97b39989871e0'
            '13d76d75247af030877f62012f8f156ca237ab33e6e083d54fbc50dfae8d1a6f')
