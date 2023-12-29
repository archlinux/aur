# Maintainer: Askhat Bakarov <sirocco  ngs  ru>

# on the base of jabref-latest

pkgname=jabref-bin
_pkgname=jabref
pkgver=5.12
pkgrel=1
pkgdesc="GUI frontend for BibTeX, written in Java; bin version which bundles the Java runtime"
arch=('x86_64')
url="https://www.jabref.org/"
license=('MIT')
provides=('jabref')
conflicts=('jabref')
depends=('freetype2'
         'libxtst'
         'libnet'
         'libxrender'
         'alsa-lib'
         'python3')
optdepends=('gsettings-desktop-schemas: For web search support')
source=(https://github.com/JabRef/jabref/releases/download/v${pkgver}/JabRef-${pkgver}-portable_linux.tar.gz
        https://raw.githubusercontent.com/JabRef/jabref/main/LICENSE
        jabref.sh
        JabRef.desktop
        JabRef.svg)
sha256sums=('82bfcf52e96086fb5567424d5d7c8b384c03d5a9b8de37a37265a6233fe58465'
            '5420fc1b814ef6776f2dfe845676b9c41e36118413e2a2d30fe0694d7a67743e'
            '857807c9240181f5d7e783898e94e523beaba8b6b55617931141cbffba41c70d'
            '81a9ce53092525d1ba964435a0558654441a85e818581453a50df1045017c131'
            '84408ddc8c6e41e4367f3b6cd171909fb1cf7ac808495f3a8033b64a2ff4c40b')


package() {
  cd ${srcdir}

  mv JabRef jabref

  install -Dm755 jabref/bin/JabRef ${pkgdir}/opt/jabref/bin/JabRef
  find jabref/lib -type f -exec install -Dm644 "{}" "${pkgdir}/opt/{}" \;
  chmod +x ${pkgdir}/opt/jabref/lib/runtime/bin/*
  chmod +x ${pkgdir}/opt/jabref/lib/runtime/lib/jexec
  chmod +x ${pkgdir}/opt/jabref/lib/runtime/lib/jspawnhelper
  chmod +x ${pkgdir}/opt/jabref/lib/jabrefHost.py

  install -Dm755 jabref.sh ${pkgdir}/usr/bin/jabref
  install -Dm644 JabRef.svg ${pkgdir}/usr/share/pixmaps/JabRef.svg
  install -Dm644 JabRef.desktop ${pkgdir}/usr/share/applications/JabRef.desktop
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}




