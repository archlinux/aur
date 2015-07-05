# Maintener: julien.chipster@archlinux.fr

pkgname=motion-mmal
pkgver=0.1
pkgrel=1
pkgdesc="Special version for PI camera. A software motion detector which grabs images from video4linux devices and/or from webcams"
arch=('armv6h')
license=('GPL')
url="http://www.lavrsen.dk/twiki/bin/view/Motion/WebHome"
depends=('libjpeg6' 'ffmpeg-compat' 'libmariadbclient' 'postgresql-libs')
backup=('etc/motion.conf')
install=motion.install

source=(https://www.dropbox.com/s/xdfcxm5hu71s97d/motion-mmal.tar.gz
        motion.service
        motion.tmpfiles)

md5sums=('55f5a112d86ae5e4c09672ba04e3091f'
         'b5b589f8f39939b7a1802cbd9dbe2e1a'
         'f863f8c025f7f025b2178def8418decd')

package(){
  # Create directories
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/etc/"
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"

  # Move files
  mv "${srcdir}/motion" "${pkgdir}/usr/bin/motion"
  mv "${srcdir}/motion-mmalcam.conf" "${pkgdir}/etc/motion.conf"
  install -Dm644 "${srcdir}/motion.service" "${pkgdir}/usr/lib/systemd/system/motion.service"
  install -Dm644 "${srcdir}/motion.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/motion.conf"
}
