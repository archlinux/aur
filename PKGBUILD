# Maintainer: dreieck

_pkgbase='38c3-styles'
pkgbase="${_pkgbase}"
pkgname=(
  "otf-pilowlava"
  "woff-pilowlava"
  "woff2-pilowlava"
  "otf-space-grotesk"
  "woff-space-grotesk"
  "woff2-space-grotesk"
  "pilowlava-font-common"
  "ttf-space-mono"
  "otf-uncut-sans"
  "ttf-uncut-sans"
  "woff-uncut-sans"
  "woff2-uncut-sans"
  "38c3-styleguide"
  "38c3-style-assets"
  "38c3-styles-commoninfo"
)
_spacegroteskver="1.1.4"
pkgver=2
pkgrel=2
pkgdesc='Fonts and styles for the 38th Chaos Communication Congress.'
arch=('any')
url='https://events.ccc.de/congress/2024/infos/styleguide.html'
license=('CC0-1.0' 'OFL-1.1')
depends=()
makedepends=(
  'fontforge'
  'html2markdown'
  # 'html2md'
  'python-html2text'
)
optdepends=()
source=(
  "https://events.ccc.de/congress/2024/infos/styleguide/38c3-styleguide-full-v${pkgver}.zip"
  "38c3-styles-website.html::${url}"
)
sha256sums=(
  '9ae65abcfc85c97a95bf64e70e9f5a0aba7948eea1d56a5a99a5feed727f5216'
  'SKIP'
)

prepare() {
  cd "${srcdir}"

  printf '%s\n' "  > Generating 'website.url' information file ..."
  printf '%s\n' "${url}" > "${srcdir}/website.url"

  cp "38c3-styles-website.html" "website.html"
}

build() {
  cd "${srcdir}"

  printf '%s\n' "  > Converting 'website.html' to text/plain format ..."
  html2text --no-wrap-links --body-width 0 --mark-code --reference-links --links-after-para --unicode-snob website.html > website.txt
  printf '%s\n' "  > Converting 'website.html' to Markdown format ..."
  html2markdown --input website.html --output website.md --output-overwrite
  # html2md -i website.html > website.md
}

package_otf-pilowlava() {
  pkgdesc='Pilowlava OTF font.'
  license=("OFL-1.1")
  depends=("pilowlava-font-common")
  optdepends=()

  cd "${srcdir}/fonts/pilowlava"
  install -Dvm644 -t "${pkgdir}/usr/share/fonts/OTF"/  Fonts/*.otf

  install -dvm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -svr "${pkgdir}/usr/share/licenses/pilowlava-font"/COPYRIGHT.md "${pkgdir}/usr/share/licenses/${pkgname}"/COPYRIGHT.md
  ln -svr "${pkgdir}/usr/share/licenses/pilowlava-font"/License.txt  "${pkgdir}/usr/share/licenses/${pkgname}"/License.txt
}

package_woff-pilowlava() {
  pkgdesc='Pilowlava woff web font.'
  license=("OFL-1.1")
  depends=("pilowlava-font-common")
  optdepends=()

  cd "${srcdir}/fonts/pilowlava"
  install -Dvm644 -t "${pkgdir}/usr/share/fonts/WOFF"/  Fonts/webfonts/*.woff

  install -dvm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -svr "${pkgdir}/usr/share/licenses/pilowlava-font"/COPYRIGHT.md "${pkgdir}/usr/share/licenses/${pkgname}"/COPYRIGHT.md
  ln -svr "${pkgdir}/usr/share/licenses/pilowlava-font"/License.txt  "${pkgdir}/usr/share/licenses/${pkgname}"/License.txt
}

package_woff2-pilowlava() {
  pkgdesc='Pilowlava woff2 web font.'
  license=("OFL-1.1")
  depends=("pilowlava-font-common")
  optdepends=()

  cd "${srcdir}/fonts/pilowlava"
  install -Dvm644 -t "${pkgdir}/usr/share/fonts/WOFF2"/  Fonts/webfonts/*.woff2

  install -dvm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -svr "${pkgdir}/usr/share/licenses/pilowlava-font"/COPYRIGHT.md "${pkgdir}/usr/share/licenses/${pkgname}"/COPYRIGHT.md
  ln -svr "${pkgdir}/usr/share/licenses/pilowlava-font"/License.txt  "${pkgdir}/usr/share/licenses/${pkgname}"/License.txt
}

package_pilowlava-font-common() {
  pkgdesc='General documentation and license for Pilowlava font.'
  license=("OFL-1.1")
  optdepends=(
    "otf-pilowlava: For Pilowlava OTF font."
    "woff-pilowlava: For Pilowlava WOFF web font."
    "woff2-pilowlava: For Pilowlava WOFF2 web font."
  )

  cd "${srcdir}/fonts/pilowlava"
  install -Dvm644 -t "${pkgdir}/usr/share/doc/pilowlava-font"/       FONTLOG.md README.md TRADEMARKS.md
  cp -rv documentation "${pkgdir}/usr/share/doc/pilowlava-font"/
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/pilowlava-font"/  COPYRIGHT.md License.txt
}

package_otf-space-grotesk() {
  pkgdesc='Space Grotesk OTF font.'
  license=("OFL-1.1")
  #pkgver="${_spacegroteskver}"
  optdepends=()

  cd "${srcdir}/fonts/space-grotesk-${_spacegroteskver}"
  install -Dvm644 -t "${pkgdir}/usr/share/fonts/OTF"/  otf/*.otf

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"/  OFL.txt
}
package_woff-space-grotesk() {
  pkgdesc='Space Grotesk woff web font.'
  license=("OFL-1.1")
  #pkgver="${_spacegroteskver}"
  optdepends=()

  cd "${srcdir}/fonts/space-grotesk-${_spacegroteskver}"
  install -Dvm644 -t "${pkgdir}/usr/share/fonts/WOFF"/  webfont/*.woff

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"/  OFL.txt
}
package_woff2-space-grotesk() {
  pkgdesc='Space Grotesk woff2 web font.'
  license=("OFL-1.1")
  #pkgver="${_spacegroteskver}"
  optdepends=()

  cd "${srcdir}/fonts/space-grotesk-${_spacegroteskver}"
  install -Dvm644 -t "${pkgdir}/usr/share/fonts/WOFF2"/  webfont/*.woff2

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"/  OFL.txt
}
package_ttf-space-mono() {
  pkgdesc='Space Mono TTF font.'
  license=("OFL-1.1")
  optdepends=()

  cd "${srcdir}/fonts/space-mono"
  install -Dvm644 -t "${pkgdir}/usr/share/fonts/TTF"/  *.ttf

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"/  OFL.txt
}
package_otf-uncut-sans() {
  pkgdesc='Uncut Sans OTF font.'
  license=("OFL-1.1")
  optdepends=()

  cd "${srcdir}/fonts/uncut-sans"
  install -Dvm644 -t "${pkgdir}/usr/share/fonts/OTF"/  Static/*.otf

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"/  LICENSE.txt
}
package_ttf-uncut-sans() {
  pkgdesc='Uncut Sans TTF font.'
  license=("OFL-1.1")
  optdepends=()

  cd "${srcdir}/fonts/uncut-sans"
  install -Dvm644 -t "${pkgdir}/usr/share/fonts/TTF"/  Variable/*.ttf

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"/  LICENSE.txt
}
package_woff-uncut-sans() {
  pkgdesc='Uncut Sans woff web font.'
  license=("OFL-1.1")
  optdepends=()

  cd "${srcdir}/fonts/uncut-sans"
  install -Dvm644 -t "${pkgdir}/usr/share/fonts/WOFF"/  Webfonts/*.woff

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"/  LICENSE.txt
}
package_woff2-uncut-sans() {
  pkgdesc='Uncut Sans woff2 web font.'
  license=("OFL-1.1")
  optdepends=()

  cd "${srcdir}/fonts/uncut-sans"
  install -Dvm644 -t "${pkgdir}/usr/share/fonts/WOFF2"/  Webfonts/*.woff2

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"/  LICENSE.txt
}

package_38c3-styleguide () {
  pkgdesc='Styleguide for the 38th Chaos Communication Congress.'
  license=("CC0-1.0")
  optdepends=(
    "38c3-styles-commoninfo: For general information files ('Readme'/ website)."
    "38c3-style-assets: For the assets except of fonts."
    "woff2-uncut-sans: For 'Uncut Sans' woff2 web font."
    "woff-uncut-sans: For 'Uncut Sans' woff web font."
    "otf-uncut-sans: For 'Uncut Sans' OTF font."
    "ttf-uncut-sans: For 'Uncut Sans' TTF font."
    "otf-pilowlava: For 'Pilowlava' OTF font."
    "ttf-space-mono: For 'Space Mono' TTF font."
    "woff-pilowlava: For 'Pilowlava' woff web font."
    "woff2-pilowlava: For 'Pilowlava' woff2 web font."
    "otf-space-grotesk: For 'Space Grotesk' OTF font."
    "woff-space-grotesk: For 'Space Grotesk' woff web font."
    "woff2-space-grotesk: For 'Space Grotesk' woff2 web font."
  )

  cd "${srcdir}"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}"/  "38c3-styleguide-v${pkgver}.pdf"
}

package_38c3-styles-commoninfo() {
  pkgdesc='General information for the styles for the 38th Chaos Communication Congress.'
  license=("CC0-1.0")
  optdepends=(
    "38c3-style-assets: For the assets except of fonts."
    "woff2-uncut-sans: For 'Uncut Sans' woff2 web font."
    "woff-uncut-sans: For 'Uncut Sans' woff web font."
    "otf-uncut-sans: For 'Uncut Sans' OTF font."
    "ttf-uncut-sans: For 'Uncut Sans' TTF font."
    "otf-pilowlava: For 'Pilowlava' OTF font."
    "38c3-styleguide: For the styleguide."
    "ttf-space-mono: For 'Space Mono' TTF font."
    "woff-pilowlava: For 'Pilowlava' woff web font."
    "woff2-pilowlava: For 'Pilowlava' woff2 web font."
    "otf-space-grotesk: For 'Space Grotesk' OTF font."
    "woff-space-grotesk: For 'Space Grotesk' woff web font."
    "woff2-space-grotesk: For 'Space Grotesk' woff2 web font."
  )

  cd "${srcdir}"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}"/  website.md website.html website.url
}

package_38c3-style-assets() {
  pkgdesc='Assets (graphics, logos, ...) except fonts for the style of the 38th chaos communication congress.'
  license=('CC0-1.0')
  optdepends=(
    "38c3-styleguide: For the styleguide."
    "38c3-styles-commoninfo: For general information files ('Readme'/ website)."
  )

  cd "${srcdir}"
  install -dvm755 "${pkgdir}/usr/share/doc"/${_pkgbase}/assets
  cp -rv assets blender luts  "${pkgdir}/usr/share/doc"/${_pkgbase}/assets/
}