# Former Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Current Maintainer: Ning Sun <sunng@about.me>
pkgname=eclipse-mat
_pgname=MemoryAnalyzer
_pkgver=1.9.0
pkgver=1.9.0
_releasedate=20190605
pkgrel=1
pkgdesc="Eclipse Memory Analyzer Tool (MAT), a toolkit for analyzing Java heap dumps."
arch=(i686 x86_64)
url="http://www.eclipse.org/mat"
license=(EPL)
depends=('java-runtime>=6' 'gtk2')
install=${pkgname}.install
sha512sums_i686=('dfc3dd333288039a7e2dcc8060704f48691ff117c9a0a4b296b7e6d2720dec49f59479af95e5e25af2c4ed985829184c0c0351199bd651b2d014443ef3e7a74f')
sha512sums_x86_64=('a8d00c73c16d11e696565696c3537cd85dae9195fa87ec8fb0fb62853b982e81623cc4c7235dc9351918a1b0af179e85404f91ed42ce3fd7e01f4c03bb067817')
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
