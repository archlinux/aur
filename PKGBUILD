# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Rob Sletten <rsletten@gmail.com>
# Contributor: Tom Moore <t.moore01@gmail.com>
# Contributor: monty <linksoft@gmx.de>
# Contributor: Jon Wiersma <archaur@jonw.org>
# Contributor: Arthur <arthur.darcet@m4x.org>
# Contributor: Praekon <praekon@googlemail.com>

# Based on the plex-media-server package by Maxime Gauduin.

pkgname=plex-media-server-plexpass
pkgver=0.9.12.6.1347
_pkgsum=54c2e56
pkgrel=1
pkgdesc='Plex Media Server (PlexPass version)'
arch=('arm' 'armv7h' 'i686' 'x86_64')
url='https://plex.tv/'
license=('custom')
depends=('systemd')
provides=('plex-media-server')
replaces=('plexmediaserver-plexpass')
conflicts=('plex-media-server' 'plexmediaserver' 'plexmediaserver-plexpass')
backup=('etc/conf.d/plexmediaserver')
install='plex-media-server.install'
source=('plexmediaserver.conf.d'
        'plexmediaserver.service'
        'terms.txt')
source_arm=("https://downloads.plex.tv/plex-media-server/${pkgver}-${_pkgsum}/PlexMediaServer-${pkgver}-${_pkgsum}-arm.spk")
source_armv7h=("https://downloads.plex.tv/plex-media-server/${pkgver}-${_pkgsum}/PlexMediaServer-${pkgver}-${_pkgsum}-arm7.spk")
source_i686=("https://downloads.plex.tv/plex-media-server/${pkgver}-${_pkgsum}/plexmediaserver-${pkgver}-${_pkgsum}.i386.rpm")
source_x86_64=("https://downloads.plex.tv/plex-media-server/${pkgver}-${_pkgsum}/plexmediaserver-${pkgver}-${_pkgsum}.x86_64.rpm")
sha256sums=('7ab1ee8da9012d257b7f473fb79d76b201ca592cbe3722f977a43b58bfad180e'
            '9da45cc3951ae03086ec663e6273c2de0183495fd15dc34ddd9aa100346d4d3a'
            '7bb97271eb2dc5d1dcb95f9763f505970d234df17f1b8d79b467b9020257915a')
sha256sums_arm=('1de42a6b8dd0f92bbbbe647b23ff8dcd9c3e1fa75b2c5b2de19b5917da31650d')
sha256sums_armv7h=('ed4c396e9a576ec3d44884b631d4c45b7506f091e51d4d69dccde184a598082d')
sha256sums_i686=('f9f5f9229c4a354b26805b9ee90a0401b23da0e4a3f5bbdd14613bdaa7375883')
sha256sums_x86_64=('e9f062e5c4d74052a146e8686775b9e537b34a23789477f53bc312f6fd2989b8')

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

  install -dm 755 "${pkgdir}"/var/lib/plex
  chown 421:421 -R "${pkgdir}"/var/lib/plex

  install -dm 755 "${pkgdir}"/usr/share/licenses/plex-media-server
  install -m 644 terms.txt "${pkgdir}"/usr/share/licenses/plex-media-server/
}

# vim: ts=2 sw=2 et:
