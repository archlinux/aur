# Maintainer: luxcem <a@luxcem.fr>
# Contributor: David Pflug <david@pflug.email>
pkgname=ttf-bitstream-charter
pkgver=1.0
pkgrel=4
_conffile=82-charter.conf
pkgdesc="A serif typeface designed by Matthew Carter for low resolution devices. Provides OTF, TTF and fontconfig configuration."
arch=("any")
depends=("fontconfig")
conflicts=("otf-bitstream-charter")
url="https://practicaltypography.com/charter.html"
license=("custom")
source=("http://practicaltypography.com/fonts/charter.zip" "${_conffile}")
sha256sums=("bcddb75c25406def3d461c6f161ce10f3b32433f5b2109fc0716782ff21285b7"
            "0de8093ecf7053865596d39fd1059f049abec480cf7488de366f1db6dc637cc8")

package() {
  install -d "${pkgdir}"/usr/share/fonts/TTF
  install -d "${pkgdir}"/usr/share/fonts/OTF
  install -Dm644 "${srcdir}"/charter/ttf/*.ttf "${pkgdir}"/usr/share/fonts/TTF
  install -Dm644 "${srcdir}"/charter/otf/*.otf "${pkgdir}"/usr/share/fonts/OTF
  install -Dm644 "${srcdir}"/charter/license.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

  # Install fontconfig file
  install -d "$pkgdir"/etc/fonts/conf.avail
  install -Dm644 "$srcdir"/${_conffile} -t "$pkgdir"/etc/fonts/conf.avail/
  install -d "$pkgdir"/etc/fonts/conf.d
  ln -rs "$pkgdir"/etc/fonts/conf.avail/${_conffile} "$pkgdir"/etc/fonts/conf.d
}
