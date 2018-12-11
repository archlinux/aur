pkgname=sakis3g
pkgver=0.2.0e
pkgrel=7
pkgdesc="An all-in-one script for connecting with 3G"
arch=(any)
url="https://github.com/Trixarian/sakis3g-source"
license=("GPL2")
depends=('ppp' 'net-tools')
optdepends=('usb_modeswitch: for switching USB modems'
            'kdialog: Graphical UI'
            'zenity: Graphical UI'
            'Xdialog: Graphical UI'
	    'libnewt: (whiptail) Text UI'
            'dialog: Text UI'
            'konsole: Terminal emulator'
            'xterm: Terminal emulator'
            '9menu: Simple and easily configurable X-menu / program launcher')
source=("https://github.com/Trixarian/sakis3g-source/archive/master.zip"
	"0a5a75babfbd8049be0cd3814df461f73880e0a7.patch")
md5sums=('bba680bdd24143b02680ef441a45ec8a'
         '22c2db69f75e17930464a7777fa3e6f6')

build() {
  cd "$srcdir/$pkgname-source-master"
  patch -p1 < ../0a5a75babfbd8049be0cd3814df461f73880e0a7.patch
  ./compile
}


package() {
  cd "$srcdir/$pkgname-source-master"
  install -d "$pkgdir/usr/bin"
  install -m755 "build/sakis3gz" "$pkgdir/usr/bin/sakis3g"
}

post_install() {
  cat <<EOF
If no GUI is shown then try
export QT_X11_NO_MITSHM=1
before starting Xserver.

For using with sudo uncomment related to X11 settings
in the /etc/sudoers
EOF
}
