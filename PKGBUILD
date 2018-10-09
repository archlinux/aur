# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Rob Sletten <rsletten@gmail.com>
# Contributor: Tom Moore <t.moore01@gmail.com>
# Contributor: monty <linksoft@gmx.de>
# Contributor: Jon Wiersma <archaur@jonw.org>
# Contributor: Arthur <arthur.darcet@m4x.org>
# Contributor: Praekon <praekon@googlemail.com>

# Based on the plex-media-server package by Maxime Gauduin.

pkgname=plex-media-server-plexpass
pkgver=1.13.9.5439
_pkgsum=7303bc002
pkgrel=1
pkgdesc='Plex Media Server (PlexPass version)'
arch=('armv7h' 'i686' 'x86_64')
url='https://plex.tv/'
license=('custom')
options=('!emptydirs')
provides=('plex-media-server')
conflicts=('plex-media-server')
backup=('etc/conf.d/plexmediaserver')
install='plex-media-server.install'
source=('plexmediaserver.conf.d'
        'plexmediaserver.service'
        'plex.sysusers'
        'plex.tmpfiles'
        'terms.txt')

source_armv7h=("https://downloads.plex.tv/plex-media-server/${pkgver}-${_pkgsum}/PlexMediaServer-${pkgver}-${_pkgsum}-arm7.spk")
source_i686=("https://downloads.plex.tv/plex-media-server/${pkgver}-${_pkgsum}/plexmediaserver-${pkgver}-${_pkgsum}.i386.rpm")
source_x86_64=("https://downloads.plex.tv/plex-media-server/${pkgver}-${_pkgsum}/plexmediaserver-${pkgver}-${_pkgsum}.x86_64.rpm")

sha256sums=('88779d4d04e44de05428754481c2b67a0e2bf47795dce875819bf7308de49025'
            '348075917da3bac9659d047a45c264c556475e66779ecd84cf00d178a5b7bebf'
            'c597bee0bcbb59ed791651555a904e5f7e9d2e82f6c6986b6352e5fc38e5b557'
            'e3c278315bf325d9bddbedbbdb5680791acdc72ce3d4972935ef27b491518ce5'
            '7bb97271eb2dc5d1dcb95f9763f505970d234df17f1b8d79b467b9020257915a')
sha256sums_armv7h=('00880cc5a0da3eea5674ae085c5c131a4522a61bf70959a01c4c435ae4e772a3')
sha256sums_i686=('2036b9a9b9f00b0dd42040bb1aa08b08ef2cd327d0dfcb4471f9c21770cc6256')
sha256sums_x86_64=('30b95a56272de7c7a80c7ba6fa951f277a3b9677d3195916ece09af7e6455cac')

prepare() {
  if [[ $CARCH = arm* ]]; then
    mkdir -p usr/lib/plexmediaserver
    bsdtar -xf package.tgz -C usr/lib/plexmediaserver/
  fi
}

package() {
  install -d -m 755 "${pkgdir}/usr/lib/plexmediaserver"
  cp -dr --no-preserve='ownership' "${srcdir}/usr/lib/plexmediaserver" "${pkgdir}/usr/lib/"

  install -D -m 644 "${srcdir}/plexmediaserver.conf.d" "${pkgdir}/etc/conf.d/plexmediaserver"
  install -D -m 644 "${srcdir}/plexmediaserver.service" "${pkgdir}/usr/lib/systemd/system/plexmediaserver.service"
  install -D -m 644 "${srcdir}/plex.sysusers" "${pkgdir}/usr/lib/sysusers.d/plex.conf"
  install -D -m 644 "${srcdir}/plex.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/plex.conf"

  install -D -m 644 "${srcdir}/terms.txt" "${pkgdir}/usr/share/licenses/${pkgname}/terms.txt"
}

# vim: ts=2 sw=2 et:
