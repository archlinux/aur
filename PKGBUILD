pkgname=openvisualtraceroute
_short_pkgname=ovtr
pkgver=2.0.0
pkgrel=1
pkgdesc="Open source cross-platform Java Visual Traceroute"
arch=('i686' 'x86_64')
license=('LGPLv3')
url="https://sourceforge.net/projects/openvisualtrace"
depends=('java-runtime=11' 'traceroute')
source=("https://downloads.sourceforge.net/project/openvisualtrace/${pkgver}/OpenVisualTraceRoute${pkgver}.zip"
        "ovtr"
        "ovtr.desktop")
sha256sums=('f72fedce4d9b5c2cf152e8808a3072a9a2197bb7fb8104ebf7f8f1e8e427d4ac'
            'a0e7609d3ea053e87c789dc1e24c522fb458daa7fdb26410c00bf0af11bbffe6'
            'af0cef38105d65182c261067577f8ff68bf50e71d4d2f4fc7fe8e0ba4472d22f')

if [ "$CARCH" = "i686" ]; then
  _arch="x86"
elif [ "$CARCH" = "x86_64" ]; then
  _arch="x64"
fi

package() {
  cd "${srcdir}/OpenVisualTraceRoute${pkgver}"

  install -d -m755 "${pkgdir}/usr/bin"
  install -d -m755 "${pkgdir}/usr/share/OpenVisualTraceRoute"
  install -d -m755 "${pkgdir}/usr/share/OpenVisualTraceRoute/"{lib,native/linux/${_arch},resources}

  cp -rPf "resources/"* "${pkgdir}/usr/share/OpenVisualTraceRoute/resources"
  cp -rPf "lib/"*.jar "${pkgdir}/usr/share/OpenVisualTraceRoute/lib"

  install -m755 "${srcdir}/${_short_pkgname}" "${pkgdir}/usr/bin/${_short_pkgname}"
  install -m755 "org.leo.traceroute.jar" "${pkgdir}/usr/share/OpenVisualTraceRoute/"

  install -D -m644 "${srcdir}/${_short_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_short_pkgname}.desktop"
  install -D -m644 "resources/icon.png" "$pkgdir/usr/share/pixmaps/${_short_pkgname}.png"
}
