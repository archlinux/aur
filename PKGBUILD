_pkgname=jitsi-meet
pkgname=${_pkgname}-bin
pkgver=1.0.3729
pkgrel=2
_debrel=1
pkgdesc="WebRTC JavaScript video conferences"
arch=('any')
url="https://jitsi.org/jitsi-meet/"
license=('Apache')
depends=()
optdepends=('jicofo'
            'jitsi-videobridge'
            'nginx'
            'prosody')
conflicts=(${_pkgname})
provides=(${_pkgname})
makedepends=('tar')
options=('!strip')
backup=('etc/jitsi/meet/config.js'
        'etc/jitsi/meet/interface_config.js'
        'etc/jitsi/meet/logging_config.js')

source=("https://download.jitsi.org/stable/${_pkgname}-web_${pkgver}-${_debrel}_all.deb"
        'config.js'
        'nginx.conf')
sha256sums=('067ff38ef484063db6756a1f06e3e55226a9a01b9ad60f4a2cbe7021423eece4'
            '47831877ef0045e343b85857a6c14fb5ec04dcc937bd6fd789fffbbf98c7a205'
            '12efa22795034c8a25fc68b4bd922d59adc8e4eb12631babdda7e048661a5be8')

package() {
  cd "${srcdir}"
  tar -xJvf data.tar.xz -C "${pkgdir}"

  rm -r "${pkgdir}/usr/share/doc"

  install -d "${pkgdir}/etc/jitsi/meet"
  install -Dm644 'config.js' "${pkgdir}/etc/jitsi/meet/config.js"
  mv "${pkgdir}/usr/share/jitsi-meet/interface_config.js" "${pkgdir}/etc/jitsi/meet/interface_config.js"
  mv "${pkgdir}/usr/share/jitsi-meet/logging_config.js" "${pkgdir}/etc/jitsi/meet/logging_config.js"
  ln -s '/etc/jitsi/meet/config.js' "${pkgdir}/usr/share/jitsi-meet/config.js"
  ln -s '/etc/jitsi/meet/interface_config.js' "${pkgdir}/usr/share/jitsi-meet/interface_config.js"
  ln -s '/etc/jitsi/meet/logging_config.js' "${pkgdir}/usr/share/jitsi-meet/logging_config.js"

  install -Dm644 'nginx.conf' "${pkgdir}/usr/share/doc/jitsi-meet/nginx.conf.example"
}

# vim: set ts=2 sw=2 et:
