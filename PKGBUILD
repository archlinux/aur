pkgname=jitsi-meet-prosody-bin
pkgver=1.0.4127
pkgrel=1
_debrel=1
pkgdesc="Prosody plugins for jitsi-meet"
arch=('any')
url="https://jitsi.org/jitsi-meet/"
license=('Apache')
depends=('prosody')
options=('!strip')
conflicts=('jitsi-meet-prosody-plugins')

source=("https://download.jitsi.org/stable/jitsi-meet-prosody_${pkgver}-${_debrel}_all.deb")
sha256sums=('bc72563dfe0bd5c1b6516fc824a48038597a56626d78af0e19484e8283da8475')

package() {
  cd "${srcdir}"
  tar -xJvf data.tar.xz -C "${pkgdir}"

  rm -r "${pkgdir}/usr/share/doc/jitsi-meet-prosody"
  mv "${pkgdir}/usr/share/jitsi-meet/prosody-plugins" "${pkgdir}/usr/share/jitsi-meet-prosody-plugins"
  rmdir "${pkgdir}/usr/share/jitsi-meet"
  mv "${pkgdir}/usr/share/jitsi-meet-prosody" "${pkgdir}/usr/share/doc/jitsi-meet-prosody-plugins"
  sed -i 's@/usr/share/jitsi-meet/prosody-plugins@/usr/share/jitsi-meet-prosody-plugins@' "${pkgdir}/usr/share/doc/jitsi-meet-prosody-plugins/prosody.cfg.lua-jvb.example"
}

# vim: set ts=2 sw=2 et:
