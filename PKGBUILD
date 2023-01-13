# Maintainer: zocker_160 <zocker1600 at posteo dot net>

pkgname=thinkfan-ui
pkgver=0.9
pkgrel=1
pkgdesc="A small gui app for Linux to control the fan speed and monitor temps on a ThinkPad"
arch=('x86_64')
url="https://github.com/zocker-160/thinkfan-ui"
license=('GPLv3')
depends=('python>=3.6' 'python-pyqt5>=5.11' 'lm_sensors')
#conflicts=('')
source=("git+https://github.com/zocker-160/thinkfan-ui.git#tag=$pkgver")
sha256sums=('SKIP')

install=thinkfan-ui.install

build() {
  cd $srcdir/$pkgname
  # nothing to see here
}

package() {
  cd $srcdir/$pkgname

  install -d -m755 src "$pkgdir"/usr/lib/"$pkgname"
  cp -r src/* "$pkgdir"/usr/lib/"$pkgname"

  # workaround issue on some Archlinux based distros
  # however we need this shit now to make CLI args work,
  # so I am commenting it out
  #sed -i -e 's/"$@"//g' linux_packaging/assets/thinkfan-ui

  install -D -m755 linux_packaging/assets/thinkfan-ui -t "$pkgdir"/usr/bin
  install -D -m644 linux_packaging/assets/thinkfan-ui.svg -t "$pkgdir"/usr/share/icons/hicolor/scalable/apps
  install -D -m644 linux_packaging/assets/thinkfan-ui.desktop -t "$pkgdir"/usr/share/applications
}
