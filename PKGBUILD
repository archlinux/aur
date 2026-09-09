# Maintainer: Matthias Mailänder <matthias@mailaender.name>

pkgname=eclipse-rcp-bin
_pkgname=eclipse-rcp
epoch=1
pkgver=4.41
pkgrel=1
_release=2026-09
pkgdesc="IDE for Rich Client Platform (RCP) and Remote Application Platform (RAP)"
arch=('x86_64')
url="https://eclipseide.org/"
license=('EPL')
provides=(eclipse=$pkgver-$pkgrel)
conflicts=(eclipse)
depends=('gtk3')
optdepends=('libsecret: password storage'
            'webkit2gtk-4.1: HTML tooltips')

_srcfilename="$_pkgname-${_release}-R-linux-gtk-$CARCH.tar.gz"
source=("$_srcfilename::https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/$_release/R/$_srcfilename&r=1"
        "eclipse.desktop::https://raw.githubusercontent.com/eclipse-linuxtools/org.eclipse.linuxtools.eclipse-build/refs/heads/master/desktopintegration/eclipse.desktop")
sha512sums=('a727e8130f88547aff2912e4b6ff3ba1b2a525d24b853acbeb43aa69886d926188bb553847261314c530e98d35744697cbfeef76fb7b46152ab05b52beb2cded'
            'bb5c1bbf07c52a68b123f40d35ffa1b09a0743003c734e53c0a0b23c4bb81a28c25b1be0c74b1507da8237db96b06f5e53baf6b6234bbc102e54602c30207291')

options=(!strip)
backup=('usr/lib/eclipse/eclipse.ini')

package() {
  install -d "${pkgdir}/usr/lib"
  cp -r "eclipse" "${pkgdir}/usr/lib/eclipse"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/eclipse/eclipse" "${pkgdir}/usr/bin/eclipse"

  install -Dm0644 "eclipse.desktop" "${pkgdir}/usr/share/applications/eclipse.desktop"

  for i in 16 22 24 32 48 64 128 256 512 1024 ; do
      install -Dm0644 eclipse/plugins/org.eclipse.platform_${pkgver}*/eclipse$i.png \
          "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/eclipse.png"
  done
}
