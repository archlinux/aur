# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Olivier Duclos <oliwer@free.fr>
# Maintainer : Daniel J Griffiths <griffithsdj@archlinux.us>

pkgname=volwheel
pkgver=0.2.8
pkgrel=7
pkgdesc="Tray icon to change volume with the mouse"
arch=('any')
url="https://oliwer.net/b/volwheel.html"
license=('GPL3')
depends=('perl-gtk2-trayicon' 'hicolor-icon-theme' 'desktop-file-utils')
optdepends=("alsa-utils: for ALSA support")
source=(https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/olwtools/${pkgname}-${pkgver}.tar.gz)
md5sums=('aee73416972c4029dfb6a6048dcf0905')

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

        # Fix deprecated defined 
        sed -i  's/defined(@ARGV)/@ARGV/g'  volwheel

        # Fix paths
        sed -i 's/\/usr\/local/\/usr/g' volwheel
        sed -i 's/${prefix}/\/usr/g' volwheel

        install -Dm755 volwheel $pkgdir/usr/bin/$pkgname

        install -d $pkgdir/usr/lib/$pkgname
        install -d $pkgdir/usr/share/$pkgname/icons

        install -m644 lib/* $pkgdir/usr/lib/$pkgname

        cp -r  icons/* $pkgdir/usr/share/$pkgname/icons/

        install -Dm644 icons/volwheel.svg $pkgdir/usr/share/icons/scalable/apps/$pkgname.svg
        install -Dm644 icons/volwheel.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg

        install -Dm644 volwheel.desktop  $pkgdir/usr/share/applications/volwheel.desktop

}
