# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=afx2usb-linux
pkgname=$_pkgname-git
pkgver=0.r4.9f2ef7d
pkgrel=1
pkgdesc="Install or uninstall USB bootloader firmware for Fractal Audio Systems Axe-FX II audio processor."
arch=('any')
url="https://github.com/TieDyedDevil/afx2usb-linux"
license=('MIT' 'custom')
depends=('fxload')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git"
        '55-fractalaudio.rules')
md5sums=('SKIP'
         'b6f4ec51dfff47ea9181e0f25f22b300')

pkgver() {
  cd "$_pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
  #git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
  #git describe --long | sed -r 's/^foo-//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  #install -Dm644 "55-fractalaudio.rules" "$pkgdir/etc/udev/rules.d/55-fractalaudio.rules"
  install -Dm644 "55-fractalaudio.rules" "$pkgdir/usr/lib/udev/rules.d/55-fractalaudio.rules"
  cd "$_pkgname"
  install -Dm644 "loader/axefx2load.hex" "$pkgdir/usr/share/usb/FractalAudio/axefx2/axefx2load.hex"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 loader/FAS-License "$pkgdir/usr/share/licenses/$pkgname/FAS-License"
}

# vim:set ts=2 sw=2 et:
