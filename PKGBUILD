pkgname=openvisualtraceroute
pkgver=1.6.0
pkgrel=1
pkgdesc="Open source cross-platform Java Visual Traceroute"
arch=('i686' 'x86_64')
license=('LGPLv3')
url="http://sourceforge.net/projects/openvisualtrace"
depends=('java-runtime')
source=("http://downloads.sourceforge.net/project/openvisualtrace/${pkgver}/OpenVisualTraceRoute${pkgver}.zip")
sha1sums=('3c0197228174f47e0acfe11414dd3661ab9f87ba')

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
  cp -rPf "native/linux/${_arch}/"*.so "${pkgdir}/usr/share/OpenVisualTraceRoute/native/linux/${_arch}"
  cp -rPf "lib/"*.jar "${pkgdir}/usr/share/OpenVisualTraceRoute/lib"

  sed -i 's|sudo ||g' "ovtr.sh"

  echo -e "#!/bin/sh\n(cd /usr/share/OpenVisualTraceRoute; ./ovtr.sh)" > ovtr

  install -m755 "ovtr" "${pkgdir}/usr/bin/ovtr"
  install -m755 "ovtr.sh" "${pkgdir}/usr/share/OpenVisualTraceRoute/"
  install -m755 "org.leo.traceroute.jar" "${pkgdir}/usr/share/OpenVisualTraceRoute/"
}

# vim:set ts=2 sw=2 et:
