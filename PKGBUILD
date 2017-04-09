# Co-Maintainer:  tilal6991 <lalitmaganti@gmail.com>
# Co-Maintainer:  vanpra <pranavmaganti@gmail.com>
# Contributor: danyf90 <daniele.formichelli@gmail.com>
# Contributor: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Christoph Brill <egore911-at-gmail-dot-com>
# Contributor: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>
# Contributor: Tad Fisher <tadfisher at gmail dot com>

pkgname=android-studio-canary
pkgver=2.4.0.4
pkgrel=1
_build=171.3883974
pkgdesc="The Official Android IDE (Canary branch)"
arch=('i686' 'x86_64')
url="http://tools.android.com/"
license=('APACHE')
makedepends=('unzip')
depends=('freetype2' 'libxrender' 'libxtst')
optdepends=('gtk2: GTK+ look and feel'
            'libgl: emulator support')
options=('!strip')
source=("https://dl.google.com/dl/android/studio/ide-zips/$pkgver/android-studio-ide-$_build-linux.zip"
        "$pkgname.desktop")
sha256sums=('7211f6b1110957f6e793b38cc6c16a65627ee4cc5db24f6d6d8d62b44e3575fc'
            '698430d3a2b3d6315ae22827e59c89e42c030089499f4e06bc32b3c92b796e35')

if [ "$CARCH" = "i686" ]; then
    depends+=('java-environment')
fi

package() {
  cd $srcdir/android-studio

  # Install the application.
  install -d $pkgdir/{opt/$pkgname,usr/bin}
  cp -a bin gradle lib jre plugins $pkgdir/opt/$pkgname
  ln -s /opt/$pkgname/bin/studio.sh $pkgdir/usr/bin/$pkgname

  # Add the icon and desktop file.
  install -Dm644 bin/studio.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  chmod -R ugo+rX $pkgdir/opt
}
