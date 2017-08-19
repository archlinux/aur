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
#https://downloads.plex.tv/plex-media-server/1.8.1.4140-82ea538ca/plexmediaserver_1.8.1.4140-82ea538ca_amd64.deb

pkgname=plex-media-server-plexpass-hwenc
pkgver=1.8.1.4140
_pkgsum=82ea538ca
pkgrel=1
pkgdesc='Plex Media Server (PlexPass version) w/ Hardware Encoding'
arch=('armv7h' 'i686' 'x86_64')
url='https://plex.tv/'
license=('custom')
options=('!emptydirs')
provides=('plex-media-server')
conflicts=('plex-media-server' 'plex-media-server-plexpass' 'plex-media-server-plexpass-dvr')
backup=('etc/conf.d/plexmediaserver')
install='plex-media-server.install'
source=('plexmediaserver.conf.d'
        'plexmediaserver.service'
        'plex.sysusers'
        'terms.txt')
source_armv7h=("https://downloads.plex.tv/plex-media-server/${pkgver}-${_pkgsum}/PlexMediaServer-${pkgver}-${_pkgsum}-arm7.spk")
source_i686=("https://downloads.plex.tv/plex-media-server/${pkgver}-${_pkgsum}/plexmediaserver-${pkgver}-${_pkgsum}.i386.rpm")
source_x86_64=("https://downloads.plex.tv/plex-media-server/${pkgver}-${_pkgsum}/plexmediaserver-${pkgver}-${_pkgsum}.x86_64.rpm")

sha256sums=('7ab1ee8da9012d257b7f473fb79d76b201ca592cbe3722f977a43b58bfad180e'
            '9da45cc3951ae03086ec663e6273c2de0183495fd15dc34ddd9aa100346d4d3a'
            'f0c915b49c6259761e2476c8388d1a744533bf3b0c21e569187fd000ebc76e0d'
            '7bb97271eb2dc5d1dcb95f9763f505970d234df17f1b8d79b467b9020257915a')

sha256sums_armv7h=('e0ce4c02324d0b73caeb3482a3006a2f1b4a968cdedd048de8506887b820e82f')
sha256sums_i686=('1d8466995af4abc724733c0c3fd29ab0f30ae98f17ccac4ece4d73838a3a55f0')
sha256sums_x86_64=('28fed608fa01288577fbf8cc2ddc7ff59b74f316195660fc6d7ca60038289018')

prepare() {
  if [[ $CARCH =~ arm* ]]; then
    mkdir -p usr/lib/plexmediaserver
    tar -xf package.tgz -C usr/lib/plexmediaserver/
  fi
}

package() {
  install -dm 755 "${pkgdir}"/{opt,etc/conf.d,usr/lib/systemd/system}
  cp -dr --no-preserve='ownership' usr/lib/plexmediaserver "${pkgdir}"/opt/
  install -m 644 plexmediaserver.service "${pkgdir}"/usr/lib/systemd/system/
  install -m 644 plexmediaserver.conf.d "${pkgdir}"/etc/conf.d/plexmediaserver
  install -Dm644 "$srcdir/plex.sysusers" "$pkgdir/usr/lib/sysusers.d/plex.conf"

  install -dm 755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m 644 terms.txt "${pkgdir}"/usr/share/licenses/${pkgname}/
}

# vim: ts=2 sw=2 et:
