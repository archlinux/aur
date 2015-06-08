# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Sebastian Sareyko <public@nooms.de>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=tvbrowser
pkgver=3.4.1.0
pkgrel=3
pkgdesc="Java-based TV guide which is easily extensible using plugins"
arch=('any')
url="http://www.tvbrowser.org"
license=('GPL3')
install="${pkgname}.install"
depends=('bash' 'giflib' 'hicolor-icon-theme' 'java-runtime')
source=(http://downloads.sourceforge.net/project/tvbrowser/TV-Browser%20Releases%20%28Java%206%20and%20higher%29/${pkgver}/tvbrowser_${pkgver}_bin.tar.gz
        http://www.tvbrowser.org/images/$pkgname/${pkgname}_logo.svg
        $pkgname.sh
        $pkgname.desktop
        $pkgname.install)
sha256sums=('4b5e8c87774470688cadc2f8568777237e231de7cc5cd8bf43b42f0af7e40992'
            'b8f8c8bade17ad3667e6cebb837288430458c9ce0eee6e7b09c7d37c1454fece'
            '9b7f35f6f30a2048ef70740929d327d34ac412dcf4c8850620370dafab6c1ca5'
            '61fe7278dcfb3a8b4557af36890cd68bc2e804b1e9bd1b6187e581c6d05e5693'
            '2fee8410377967df66bae9118d2160ea5ed5d6d116e772c8500a81b91b2ec5a1')

package () {
  # Removing delivered desktop entry and shell script.
  rm $srcdir/$pkgname-$pkgver/$pkgname.{sh,desktop}

  install -d -m755 $pkgdir/usr/share/java
  cp -R $srcdir/$pkgname-$pkgver $pkgdir/usr/share/java/$pkgname

  # Installing the official scalable logo, which can/will be used by modern window managers / desktop environments that support SVG.
  install -D -m644 $srcdir/${pkgname}_logo.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg

  install -D -m755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
  install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  # Installing the complete bundle of copyright notices. At least because of the BSD license part this step is necessary (http://wiki.archlinux.org/index.php/Arch_Packaging_Standards#Licenses)
  install -D -m644 $srcdir/$pkgname-$pkgver/COPYRIGHT.txt $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT.txt

  # For window managers that don't support SVG (yet) (like e.g. fluxbox), we can also install the set of icons as delivered by the tvbrowser package.
  for _i in 16 32 48 128; do
    install -D -m644 $srcdir/$pkgname-$pkgver/imgs/${pkgname}${_i}.png $pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/$pkgname.png
  done
}
