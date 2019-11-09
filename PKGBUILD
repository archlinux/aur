# Maintainer: Adler Neves <adlerosn@gmail.com>

provides=('dia-integrated')
conflicts=()
pkgver=0.0.1
pkgname=dia-integrated
pkgrel=1
pkgdesc="A shortcut to display a GTK+ based diagram creation program in a single window (with --integrated argument)."
arch=('any')
depends=('dia')
makedepends=('dia')
url="http://live.gnome.org/Dia"
options=()
license=('GPL')

prepare() {
  echo "#!/bin/bash" > "${srcdir}/dia-integrated"
  echo "dia --integrated \"\$@\"" >> "${srcdir}/dia-integrated"
  cat /usr/share/mime-info/dia.keys | sed 's/x-dia-diagram/x-dia-integrated-diagram/' | sed 's/=dia/=dia-integrated/' > "${srcdir}/dia-integrated.keys"
  cat /usr/share/mime-info/dia.mime | sed 's/x-dia-diagram/x-dia-integrated-diagram/' > "${srcdir}/dia-integrated.mime"
  cat /usr/share/applications/dia.desktop | sed '/^Name/ s/$/ (--integrated)/' | sed '/^Comment/ s/$/ (--integrated)/' | sed 's/^Exec=dia/Exec=dia-integrated/' | sed 's/x-dia-diagram/x-dia-integrated-diagram/' > "${srcdir}/dia-integrated.desktop"
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/mime-info"
  
  cp "${srcdir}/dia-integrated" "${pkgdir}/usr/bin/dia-integrated"
  cp "${srcdir}/dia-integrated.desktop" "${pkgdir}/usr/share/applications/dia-integrated.desktop"
  cp "${srcdir}/dia-integrated.mime" "${pkgdir}/usr/share/mime-info/dia-integrated.mime"
  cp "${srcdir}/dia-integrated.keys" "${pkgdir}/usr/share/mime-info/dia-integrated.keys"
  
  chmod 0755 "${pkgdir}/usr/share/applications/dia-integrated.desktop"
  chmod 0755 "${pkgdir}/usr/bin/dia-integrated"
  chmod 0644 "${pkgdir}/usr/share/mime-info/dia-integrated.mime"
  chmod 0644 "${pkgdir}/usr/share/mime-info/dia-integrated.keys"
}
