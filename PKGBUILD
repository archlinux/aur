# $Id: 2292c56ecdc8d3b72b867af8b5753f47ebcdaab1 $
# Maintainer: Ido Rosen <ido@kernel.org>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
# 

pkgname='sfptpd'
pkgdesc="Solarflare Enhanced PTP daemon."
pkgver='2.2.4.70'
pkgrel=1
arch=('x86_64')
url='http://www.solarflare.com/'
license=('custom')
depends=('openonload')
makedepends=()
options=('!libtool' '!strip' '!makeflags' '!buildflags' 'staticlibs')
source=("http://127.0.0.1/SF-108910-LS-11_Solarflare_Enhanced_PTP_Daemon_sfptpd_-_64_bit_binary_tarball.tgz"
        "http://127.0.0.1/SF-108910-LS-11_Solarflare_Enhanced_PTP_Daemon_sfptpd_-_64_bit_binary_tarball.rl.txt"
        'sfptpd.service')
sha512sums=('69b71afff6dab4dab9f7de8fc02431cea95853a68b237876f6d63deb4bcf023d238648bff8162b4d9af57847b1be8f3bcf6bf49cbdaf8b9537a568d2568c6ad9'
            'b61a0ecc9af7ed6c880c436154b872c480623accd8a006c6dd29e3dd53e260a4ec947e6b4adc17b9bff23d409433498a63ec05a5f1396781e15e100338ebdb11'
            'b3dcb610b5298ea68de03f4cde1ad52063176754da756b4b328955be0035a760aef59b72d0f5f92313f524a76d48551378ffcd93e8fd63fbd4b254f417ea7561')

package() {
  # Systemd service:
  install -dm755                  "${pkgdir}/usr/lib/systemd/system/"
  install -m644 sfptpd.service    "${pkgdir}/usr/lib/systemd/system/"

  cd "${srcdir}/${pkgname}-${pkgver}.${arch}"

  # Binaries:
  install -Dm755 "sfptpd" "${pkgdir}/usr/bin/sfptpd"

  # Documentation:
  install -dm755                  "${pkgdir}/usr/share/doc/${pkgname}"
  RLN="SF-108910-LS-11_Solarflare_Enhanced_PTP_Daemon_sfptpd_-_64_bit_binary_tarball.rl.txt"
  install -m644 "${srcdir}/${RLN}" "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 COPYRIGHT         "${pkgdir}/usr/share/doc/${pkgname}"
  install -dm755                  "${pkgdir}/usr/share/doc/${pkgname}/config"
  install -m644 config/*          "${pkgdir}/usr/share/doc/${pkgname}/config"

  # Install LICENSE file:
  install -dm755                  "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/COPYRIGHT" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
