##PKGBUILD
pkgname=hedera-theme-git
pkgver=0.r2.f92f398
pkgrel=2
pkgdesc='Eye-friendly GUIKit based on breeze'
arch=('x86_64')
url='https://github.com/sixsixfive/Hedera/blob/master/readme.md'
depends=('breeze')
gitname=Hedera
makedepends=(git coreutils)
optdepends=('qt5ct-svg: needed for the darker sub theme'
		'breeze-kde4: for qt4'
		'gtk2: gtk2'
		'gtk-engines: gtk2'
		'gtk-engine-murrine: gtk2'
		'gtk3>=3.20: gtk3'
		'gtk3-noosb: gtk3'
		'gtk3-nocsd-git: optional for gtk3'
		'qupzilla'
		'konsole'
		'yakuake'
		'chromium'
		'qterminal')
#kde gtk config breaks gtk2 font settings!
#conflicts=("kde-gtk-config")
license=(CCPL:cc-by-sa-4.0)
source=("$gitname::git://github.com/sixsixfive/Hedera"
        "settings.ini"
        "gtkrc")
sha256sums=('SKIP'
            '928f0276ab79c0f0ced734330877b3761e8159661b5a9e38180f4dfd544e051e'
            'ffc83083ccd1f647afdd3f94e337affc4c6f22718cee596faedf7bfb6a32b561')

pkgver() {
  cd "$srcdir/$gitname"
	printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/$gitname
	install -dm 755 "$pkgdir"/usr/share/
  install -dm 755 "$pkgdir"/usr/share/kf5/infopage/
  install -dm 755 "$pkgdir"/usr/share/kde4/apps/kdeui/about/
  install -dm 755 "$pkgdir"/etc/
  install -dm 755 "$pkgdir"/etc/xdg/
  install -dm 755 "$pkgdir"/etc/hedera/
  install -dm 755 "$pkgdir"/etc/X11/xinit/xinitrc.d/
  install -dm 755 "$pkgdir"/etc/gtk-{2.0,3.0}

  #Installing Themes
	cp -drv --no-preserve='ownership' THEME/* $pkgdir/usr/share/
  install -Dm755 ../{settings.ini,gtkrc} "$pkgdir"/etc/hedera/ 
  #Install configs
  cp -drv --no-preserve='ownership' MANUAL/Configs/etc/* "$pkgdir"/etc/
  rm -r "$pkgdir"/etc/X11/Xsession.d/
  install -Dm755 MANUAL/Configs/etc/X11/Xsession.d/98gtk3-nosb "$pkgdir"/etc/X11/xinit/xinitrc.d/gtk3-nosb.sh
}
