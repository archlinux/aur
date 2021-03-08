# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Shaun Bartlett <tixetsal@gmail.com>
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
pkgver=1.22.0.4157
_pkgsum=d1699ac4a
pkgrel=1
pkgdesc='The back-end media server component of Plex.'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://plex.tv/'
license=('custom')
options=('!emptydirs' '!strip' 'staticlibs')
provides=('plex-media-server')
conflicts=('plex-media-server')
backup=('etc/conf.d/plexmediaserver')
install='plex-media-server.install'
source=('plexmediaserver.conf.d'
        'plexmediaserver.service'
        'plexmediaserver.hook'
        'plex.sysusers'
        'plex.tmpfiles'
        'terms.txt')

source_aarch64=("https://downloads.plex.tv/plex-media-server-new/${pkgver}-${_pkgsum}/debian/plexmediaserver_${pkgver}-${_pkgsum}_arm64.deb")
source_armv7h=("https://downloads.plex.tv/plex-media-server-new/${pkgver}-${_pkgsum}/debian/plexmediaserver_${pkgver}-${_pkgsum}_armhf.deb")
source_x86_64=("https://downloads.plex.tv/plex-media-server-new/${pkgver}-${_pkgsum}/redhat/plexmediaserver-${pkgver}-${_pkgsum}.x86_64.rpm")
source_i686=("https://downloads.plex.tv/plex-media-server-new/${pkgver}-${_pkgsum}/redhat/plexmediaserver-${pkgver}-${_pkgsum}.i686.rpm")

sha256sums=('b7f2fb1cbedde54a79a1794ec9f35f8bdeb033a4c5453ec77944ca7fe77cd9b7'
            'a5d2cb13a734b0f3e12c6f9596aa632b012ff59f370eeefe00b7a78bfabd8b14'
            'a94c798e3a1b5614020e3dd6ec80d378c0401fa08f411769527ad87a6898e80c'
            'c597bee0bcbb59ed791651555a904e5f7e9d2e82f6c6986b6352e5fc38e5b557'
            'b7ff6525a3c7a8be885edc85bb523095f8e25ddb38873127e2a4e97b28f2c7ad'
            '7bb97271eb2dc5d1dcb95f9763f505970d234df17f1b8d79b467b9020257915a')
sha256sums_x86_64=('be8227afd69a38029bc0f839602a17627557e44faddf959f90ab3978ee820a65')
sha256sums_i686=('ef3f888ee4a9a28def365b52e6e819404a6e61a1c9203a9293301c111e418ff2')
sha256sums_armv7h=('ed57bb8664247fc8914c33d5026aa8af226b88b8998a2badb1a03c90fa38262c')
sha256sums_aarch64=('f19e6e86aeaa14476e0d645f802370e5fe24d340ee3e3a623bd2151c38375dc5')

prepare() {
  if [[ $CARCH = armv7h ]] || [[ $CARCH = aarch64 ]]; then
    bsdtar -xf data.tar.xz
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
  install -D -m 644 "${srcdir}/plexmediaserver.hook" "${pkgdir}/usr/share/doc/${pkgname}/plexmediaserver.hook"
}

# vim: ts=2 sw=2 et:
