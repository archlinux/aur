# Maintainer: Tad Fisher <tadfisher at gmail dot com>
# Contributor:  tilal6991 <lalitmaganti@gmail.com>
# Contributor: danyf90 <daniele.formichelli@gmail.com>
# Contributor: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Christoph Brill <egore911-at-gmail-dot-com>
# Contributor: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=android-studio-beta
pkgver=2.2.0rc2
_pkgver=2.2.0.11
pkgrel=1
_build=145.3253452
pkgdesc="The Official Android IDE (Beta branch)"
arch=('i686' 'x86_64')
url="http://tools.android.com/"
license=('APACHE')
makedepends=('unzip')
depends=('alsa-lib' 'freetype2' 'libxrender' 'libxtst')
optdepends=('gtk2: GTK+ look and feel'
            'libgl: emulator support')
options=('!strip')
source=("https://dl.google.com/dl/android/studio/ide-zips/$_pkgver/android-studio-ide-$_build-linux.zip"
        "$pkgname.desktop")
sha1sums=('38046857e008d059ca1a1655dc4f4d2250bbc157'
          'b61f3bf3449f79f8b15aea93414398848e5a6614')
validpgpkeys=('70617B1131063C47E8084DD10DDE73383977AC09') # Tad Fisher


if [ "$CARCH" = "i686" ]; then
    depends+=('java-environment')
fi

package() {
  cd $srcdir/android-studio

  # application stuff
  install -d $pkgdir/{opt/$pkgname,usr/bin}
  cp -a bin gradle lib jre plugins $pkgdir/opt/$pkgname
  ln -s /opt/$pkgname/bin/studio.sh $pkgdir/usr/bin/$pkgname

  # starter stuff
  install -Dm655 bin/studio.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm655 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  chmod -R ugo+rX $pkgdir/opt
}
