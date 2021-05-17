# Maintainer: luxcem <a@luxcem.fr>
# Contributor: David Pflug <david@pflug.email>
pkgname=ttf-bitstream-charter
pkgver=1.0
pkgrel=5
_conffile=82-charter.conf
pkgdesc="A serif typeface designed by Matthew Carter for low resolution devices. Provides OTF, TTF and fontconfig configuration."
arch=("any")
depends=("fontconfig")
conflicts=("otf-bitstream-charter")
url="https://practicaltypography.com/charter.html"
license=("custom")
source=("https://practicaltypography.com/fonts/Charter%20210112.zip" "${_conffile}")
sha256sums=('b40297f1a615f94594bdad0995848eb2223fb53ccb4ea197cabf24439bd811c9'
            '0de8093ecf7053865596d39fd1059f049abec480cf7488de366f1db6dc637cc8')

package() {
  install -d "${pkgdir}"/usr/share/fonts/TTF
  install -d "${pkgdir}"/usr/share/fonts/OTF
  install -Dm644 "${srcdir}/Charter 210112/TTF format (best for Windows)/Charter/"*.ttf "${pkgdir}"/usr/share/fonts/TTF
  install -Dm644 "${srcdir}/Charter 210112/OTF format (best for Mac OS)/Charter/"*.otf "${pkgdir}"/usr/share/fonts/OTF
  install -Dm644 "${srcdir}/Charter 210112/Charter license.txt" "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

  # Install fontconfig file
  install -d "$pkgdir"/etc/fonts/conf.avail
  install -Dm644 "$srcdir"/${_conffile} -t "$pkgdir"/etc/fonts/conf.avail/
  install -d "$pkgdir"/etc/fonts/conf.d
  ln -rs "$pkgdir"/etc/fonts/conf.avail/${_conffile} "$pkgdir"/etc/fonts/conf.d
}
