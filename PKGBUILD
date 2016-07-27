# $Id$
# Maintainer: kvaps <kvapss@gmail.com>

pkgname=keepass-wine
pkgver=2.34
pkgrel=6
pkgdesc='A easy-to-use password manager for Windows, Linux, Mac OS X and mobile devices. (Wine version)'
arch=('any')
url='http://keepass.info/'
license=('GPL')
depends=('wine' 'desktop-file-utils' 'xdg-utils' 'gtk-update-icon-cache')
makedepends=('icoutils')
source=("http://downloads.sourceforge.net/keepass/KeePass-$pkgver.zip"
        "http://download.lenovo.com/ibmdl/pub/pc/pccbbs/thinkvantage_en/dotnetfx.exe"
        'keepass-wine'
        'keepass-wine.desktop'
        'KeePass.ico')

sha256sums=('52dd5a8526cc935b0e240d5ab6402b0b4a3f5f09ad1a6919875878d7f36c697f'
            '46693d9b74d12454d117cc61ff2e9481cabb100b4d74eb5367d3cf88b89a0e71'
            'a77c586200debc52193ece67742b1c2ef51699310e807b481761149c4ab0ae5d'
            '685fa3a4e7c9dfcd04bd2be7000bcbbd353c5a1a60f1697c7469e35dd361432d'
            'd08ebdd9b0a99f6dc4f62bb20d7bb9ce6ab3139fcb31c8830954e16ebbd3d058')

validpgpkeys=('D95044283EE948D911E8B606A4F762DC58C6F98E')

prepare() {
  # Extract icons
  icotool -x KeePass.ico
}

package() {
  install -dm755 "$pkgdir"/usr/bin
  install -dm755 "$pkgdir"/usr/share/keepass-wine/XSL

  install -Dm755 keepass-wine "$pkgdir"/usr/bin/keepass-wine
  install -Dm755 dotnetfx.exe "$pkgdir"/usr/share/keepass-wine/dotnetfx.exe
  install -Dm755 KeePass.exe "$pkgdir"/usr/share/keepass-wine/KeePass.exe
  install -Dm755 KeePass.exe.config "$pkgdir"/usr/share/keepass-wine/KeePass.exe.config
  install -m644 XSL/* "$pkgdir"/usr/share/keepass-wine/XSL

  # Proper installation of .desktop file
  desktop-file-install -m 644 --dir "$pkgdir"/usr/share/applications/ keepass-wine.desktop

  # Install icons
  for size in 16 32 48 256; do
    install -Dm644 \
    KeePass_*_${size}x${size}x32.png \
    "$pkgdir"/usr/share/icons/hicolor/${size}x${size}/apps/keepass-wine.png
  done
}
