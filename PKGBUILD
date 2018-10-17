# Former Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Current Maintainer: Ning Sun <sunng@about.me>
pkgname=eclipse-mat
_pgname=MemoryAnalyzer
_pkgver=1.8.1
pkgver=1.8.1
_releasedate=20180910
pkgrel=1
pkgdesc="Eclipse Memory Analyzer Tool (MAT), a toolkit for analyzing Java heap dumps."
arch=(i686 x86_64)
url="http://www.eclipse.org/mat"
license=(EPL)
depends=('java-runtime>=6' 'gtk2')
install=${pkgname}.install
sha512sums_i686=('0e811c006866a22f764d535754380565f4a99e6ff4b715630827da78f4c02d346a8eafef73d3bb4cecce84415cdd8a79cd95be2e38a73385d8181ff7121a1d64')
sha512sums_x86_64=('43f284fd5b48d0cba4192be8485d10c64ba630362d5d555be32a2aa69260dc2a4724bf0e1f3734d86bbc0c4f22aa924cf41fac8e7bfffdff9f2a6fc47d4140d2')
source_i686=("${pkgname}-${pkgver}-x86.zip::http://download.eclipse.org/mat/${_pkgver}/rcp/${_pgname}-${pkgver}.${_releasedate}-linux.gtk.x86.zip")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::http://download.eclipse.org/mat/${_pkgver}/rcp/${_pgname}-${pkgver}.${_releasedate}-linux.gtk.x86_64.zip")


build() {
  msg2 "Generate desktop application entry..."
  cat > "${srcdir}"/${pkgname}.desktop << EOF
[Desktop Entry]
Version=${pkgver}
Encoding=UTF-8
Name=Eclipse MAT
Comment=${pkgdesc}
Exec=/usr/bin/${pkgname}
Terminal=false
Type=Application
Categories=Development;
EOF
}

package() {
  msg2 "Install the assembly at /opt/${pkgname}..."
  install -dm755          "${pkgdir}"/opt/${pkgname}
  cp -a "${srcdir}"/mat/* "${pkgdir}"/opt/${pkgname}

  msg2 "Install link to the executable in /usr/bin..."
  install -dm755                   "${pkgdir}"/usr/bin
  ln -s /opt/${pkgname}/${_pgname} "${pkgdir}"/usr/bin/${pkgname}

  msg2 "Install link to the config file in /etc..."
  install -dm755                       "${pkgdir}"/etc
  ln -s /opt/${pkgname}/${_pgname}.ini "${pkgdir}"/etc/${pkgname}.ini

  msg2 "Install links to copyright resources at /usr/share/licenses/${pkgname}..."
  install -dm755                     "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /opt/${pkgname}/epl-v10.html "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s /opt/${pkgname}/notice.html  "${pkgdir}/usr/share/licenses/${pkgname}/"

  msg2 "Install desktop application entry in /usr/share/applications..."
  install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}
