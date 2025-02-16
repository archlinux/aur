# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgbase=ibm-plex-fonts-git
pkgname=(otf-ibm-plex-git ttf-ibm-plex-git woff2-ibm-plex-git) #eot-ibm-plex-git woff-ibm-plex-git
pkgver=r346.bfd83ce90
pkgrel=2
pkgdesc="IBM Plex fonts"
arch=(any)
url="https://github.com/IBM/plex"
license=(OFL-1.1)
makedepends=(git)
source=("ibm-plex::git+https://github.com/IBM/plex.git")
sha256sums=(SKIP)

pkgver() {
  cd ibm-plex
  #git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# plex-sans-jp -> hinted/unhinted for all
# plex-sans-tc -> hinted/unhinted for all
# plex-sans-kr -> hinted/unhinted for eot, ttf, woff, woff2
# plex-sans-variable -> not otf

package_otf-ibm-plex-git() {
  provides=(otf-ibm-plex)
  conflicts=(otf-ibm-plex)

  cd ibm-plex/packages

  for variant in plex-math plex-mono plex-sans plex-sans-arabic plex-sans-condensed plex-sans-devanagari plex-sans-hebrew \
                 plex-sans-kr plex-sans-thai plex-sans-thai-looped plex-serif; do
    install -d "$pkgdir"/usr/share/fonts/OTF/ibm-plex/${variant,,}
    install -Dm644 ${variant}/fonts/complete/otf/*.otf "$pkgdir"/usr/share/fonts/OTF/ibm-plex/${variant,,}
  done

	install -Dm644 ../LICENSE.txt -t "$pkgdir"/usr/share/licenses/${pkgname}/
}

package_ttf-ibm-plex-git() {
  provides=(ttf-ibm-plex)
  conflicts=(ttf-ibm-plex)

  cd ibm-plex/packages

  for variant in plex-math plex-mono plex-sans plex-sans-arabic plex-sans-condensed plex-sans-devanagari plex-sans-hebrew \
                 plex-sans-thai plex-sans-thai-looped plex-sans-variable plex-serif; do
    install -d "$pkgdir"/usr/share/fonts/TTF/ibm-plex/${variant,,}
    install -Dm644 ${variant}/fonts/complete/ttf/*.ttf "$pkgdir"/usr/share/fonts/TTF/ibm-plex/${variant,,}
  done

	install -Dm644 ../LICENSE.txt -t "$pkgdir"/usr/share/licenses/${pkgname}/
}

package_woff-ibm-plex-git() {
  provides=(woff-ibm-plex)
  conflicts=(woff-ibm-plex)

  cd ibm-plex/packages

  for variant in plex-math plex-mono plex-sans plex-sans-arabic plex-sans-condensed plex-sans-devanagari plex-sans-hebrew \
                 plex-sans-thai plex-sans-thai-looped plex-sans-variable plex-serif; do
    install -d "$pkgdir"/usr/share/fonts/WOFF/ibm-plex/${variant,,}
    install -Dm644 ${variant}/fonts/complete/woff/*.woff "$pkgdir"/usr/share/fonts/WOFF/ibm-plex/${variant,,}
  done

	install -Dm644 ../LICENSE.txt -t "$pkgdir"/usr/share/licenses/${pkgname}/
}

package_woff2-ibm-plex-git() {
  provides=(woff2-ibm-plex)
  conflicts=(woff2-ibm-plex)

  cd ibm-plex/packages

  for variant in plex-math plex-mono plex-sans plex-sans-arabic plex-sans-condensed plex-sans-devanagari plex-sans-hebrew \
                 plex-sans-thai plex-sans-thai-looped plex-sans-variable plex-serif; do
    install -d "$pkgdir"/usr/share/fonts/WOFF2/ibm-plex/${variant,,}
    install -Dm644 ${variant}/fonts/complete/woff2/*.woff2 "$pkgdir"/usr/share/fonts/WOFF2/ibm-plex/${variant,,}
  done

	install -Dm644 ../LICENSE.txt -t "$pkgdir"/usr/share/licenses/${pkgname}/
}
