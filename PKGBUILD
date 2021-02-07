# Maintainer: Alexander Mcmillan <linuxguy93@gmail.com>
pkgname=amplex
pkgver=4.0.0
pkgrel=1
pkgdesc="A Multiamp Amplifier Plugin."
arch=('x86_64')
url="http://nalexsoft.blogspot.com/2020/07/amplex-multiamp_6.html"
license=('EULA')
groups=('pro-audio' 'vst-plugins')

prepare () {
  ## Extract Amplex VST
  _archive="`xdg-user-dir DOWNLOAD`/Amplex_V4-0_VST_Linux_x64.zip"
  ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
  unzip "$srcdir/`basename "${_archive}"`"
  
  ## Extract Amplex Presets
  _presets="`xdg-user-dir DOWNLOAD`/Amplex_Presets_V22.zip"
  ln -srf "${_presets}" "$srcdir/`basename "${_presets}"`"
  unzip "$srcdir/`basename "${_presets}"`"
}

package() {
  ## Install Amplex VST
  install -Dm755 $srcdir/Amplex_V4-0_x64.so $pkgdir/usr/lib/vst/Amplex_V4-0_x64.so
  install -Dm755 $srcdir/IRbis_V1-0_x64.so $pkgdir/usr/lib/vst/IRbis_V1-0_x64.so
  
  ## Install Amplex Presets
  mkdir -p $pkgdir/usr/share/amplex
  cp $srcdir/\!\ Documentation/Elements/*.txt $pkgdir/usr/share/amplex
  cp $srcdir/Amplex_Presets_V22/*.txt $pkgdir/usr/share/amplex
  rm $pkgdir/usr/share/amplex/\!\ Read\ About.txt
}
