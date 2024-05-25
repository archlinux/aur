# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski at archlinux dot org>
# Contributor: Felipe Hommen <felibank at gmail dot com>
# Contributor: moostik <mooostik at gmail dot com>

pkgname=geogebra-6-bin
pkgver=6.0.804.0
pkgrel=1
pkgdesc='Dynamic mathematics software with interactive graphics, algebra and spreadsheet'
arch=(x86_64)
url='https://www.geogebra.org/'
license=(GPL3 'CCPL:by-sa' 'CCPL:by-nc')
depends=(electron)
conflicts=(geogebra)
source=(https://download.geogebra.org/installers/6.0/GeoGebra-Linux64-Portable-${pkgver//./-}.zip)
sha256sums=('114e537fad9322e1ae8ebdf8aa734e473b3c66a9f1d98c5a1ec5fa55d6ea9bd7')

package() {

echo -e '#!/bin/sh

electron "/usr/lib/geogebra/resources/app" $@' > geogebra


echo -e '[Desktop Entry]
Version=1.0
Type=Application
Name=GeoGebra
Comment=Dynamic mathematics software with interactive graphics, algebra and spreadsheet
Exec=geogebra
Icon=geogebra
Terminal=false
StartupNotify=false
Categories=Education;Science;Math;
MimeType=application/vnd.geogebra.file;application/vnd.geogebra.tool;' > geogebra.desktop

echo -e '<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
  <mime-type type="application/vnd.geogebra.file">
         <comment>GeoGebra worksheet</comment>
         <comment xml:lang="cs">Pracovní list GeoGebry</comment>
         <comment xml:lang="de">GeoGebra-Arbeitsblatt</comment>
         <comment xml:lang="es">Archivo GeoGebra</comment>
         <comment xml:lang="fr">Feuille de travail GeoGebra </comment>
         <comment xml:lang="hi">जीओ-जेब्रा कार्य-पत्र</comment>
         <comment xml:lang="it">Foglio di lavoro GeoGebra </comment>
         <comment xml:lang="pt-BR">Planilha GeoGebra</comment>
         <sub-class-of type="application/zip"/>
         <glob pattern="*.ggb"/>
  </mime-type>
  <mime-type type="application/vnd.geogebra.tool">
         <comment>GeoGebra tool</comment>
         <comment xml:lang="cs">Nástroj GeoGebry</comment>
         <comment xml:lang="de">GeoGebra-Werkzeug</comment>
         <comment xml:lang="es">Herramienta GeoGebra</comment>
         <comment xml:lang="fr">Outil GeoGebra</comment>
         <comment xml:lang="hi">जीओ-जेब्रा साधन</comment>
         <comment xml:lang="it">Strumento GeoGebra</comment>
         <comment xml:lang="pt-BR">Ferramenta GeoGebra</comment>
         <sub-class-of type="application/zip"/>
         <glob pattern="*.ggt"/>
  </mime-type>
</mime-info>' > geogebra-mime.xml

echo -e '<?xml version="1.0"?>
<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28">
<path fill="none" stroke="#666" stroke-width="2.2" d="m15.3,4.7a11.4,9.1-26 1,0 1,0z"/>
<g stroke-linecap="round">
<path stroke="#000" stroke-width="6" d="m13.2,4.9h0M3.8,11.8h0M7.2,22.9h0M20.1,21.2h0M24.4,10.1h0"/>
<path stroke="#99F" stroke-width="4.3" d="m13.2,4.9h0M3.8,11.8h0M7.2,22.9h0M20.1,21.2h0M24.4,10.1h0"/>
</g></svg>' > geogebra-logo.svg


  cd GeoGebra-linux-x64

  install -Dm755 "$srcdir"/geogebra "$pkgdir"/usr/bin/geogebra
  install -dm755 "$pkgdir"/usr/lib/geogebra
  cp -dpr --no-preserve=ownership resources "$pkgdir"/usr/lib/geogebra
  cp -dpr --no-preserve=ownership locales "$pkgdir"/usr/lib/geogebra

  install -Dm644 "$srcdir"/geogebra.desktop -t "$pkgdir"/usr/share/applications/
  install -Dm644 "$srcdir"/geogebra-logo.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/geogebra.svg
  install -Dm644 "$srcdir"/geogebra-mime.xml "$pkgdir"/usr/share/mime/packages/geogebra.xml
}
