# Maintainer: justbrowsing <developer4linux+aur@gmail.com>
# Contributor: Thorsten Tapper <atsutane-tu@freethoughts.de>
# Contributor: jaseg <github@jaseg.net>

pkgname=i3lock-spy
pkgver=2.4.4
pkgrel=3
pkgdesc="A screenlocker with intruder detection designed for JustBrowsing"
arch=('i686' 'x86_64' 'armv6h')
url="https://github.com/justbrowsing/i3lock-spy"
license=('MIT')
groups=("justbrowsing")
depends=('xcb-util-image' 'xcb-util-keysyms' 'pam' 'libev' 'cairo' 'fswebcam' 'v4l-utils')
optdepends=('wbar: To add a lockscreen panel in JustBrowsing' 
			'adeskbar: To add a lockscreen panel in jb-next')
conflicts=('i3lock')
provides=('i3lock')
options=('docs')
backup=("etc/pam.d/i3lock")
source=("https://github.com/justbrowsing/i3lock-spy/archive/master.tar.gz")
md5sums=('7348dd53ce18a434aa4815059cec92a4')

build() {
  cd "$srcdir/${pkgname}-master"
  make
}

package() {
  cd "$srcdir/${pkgname}-master"

  mkdir -p $pkgdir/usr/bin
  cp i3lock-sentry $pkgdir/usr/bin/
  chmod +x $pkgdir/usr/bin/i3lock-sentry

  make DESTDIR="${pkgdir}" install
  cp i3lock $pkgdir/usr/bin/i3lock
  cp i3lock-spy $pkgdir/usr/bin/i3lock-spy
  cp i3lock-spy-mouse $pkgdir/usr/bin/i3lock-spy-mouse
  cp i3lock-spy-panel $pkgdir/usr/bin/i3lock-spy-panel

  install -Dm644 sentry.css ${pkgdir}/etc/xdg/i3lock/sentry.css
  install -Dm644 placeholder.png ${pkgdir}/etc/xdg/i3lock/placeholder.png
  install -Dm644 i3lock.1.gz ${pkgdir}/usr/share/man/man1/i3lock.1.gz
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/i3lock/LICENSE
  make clean
}

