# Maintainer: Matthias Mailänder <matthias [at] mailaender [dot] name>

pkgname=eclipse-rcp-bin
_pkgname=eclipse-rcp
epoch=1
pkgver=4.34
pkgrel=1
_release=2024-12/R
pkgdesc="IDE for Rich Client Platform (RCP) and Remote Application Platform (RAP)"
arch=('x86_64')
url="https://eclipse.org/ide"
license=('EPL')
provides=(eclipse=$pkgver-$pkgrel)
conflicts=(eclipse)

_srcfilename="$_pkgname-${_release//\//-}-linux-gtk-$CARCH.tar.gz"
source=("$_srcfilename::https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/$_release/$_srcfilename&r=1"
        "eclipse.desktop::https://raw.githubusercontent.com/Mailaender/org.eclipse.linuxtools.eclipse-build/patch-1/desktopintegration/eclipse.desktop")
sha512sums=('192e5606a7788e6e16faa83d941872be191957596643428c70481859f2512e50295d2ef379b787022e274115b837fcaa595b35dab137cf1c70135a952d0430d6'
            '824875ab1454349a58eb2bb6fd70edd5e7a8e14a9b999372024374a1e04722398095db9bdba91b17bfb424c1e1271446f0370c79596f35fb516dbada31aebec5')

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
