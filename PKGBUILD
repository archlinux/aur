# Maintainer: kpcyrd <git@rxv.cc>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_gitname=usbctl
pkgname=usbctl-git
pkgver=1.0.r1.g7c5bf0e
pkgrel=2
pkgdesc='Linux-hardened deny_new_usb control'
url='https://github.com/anthraxx/usbctl'
arch=('any')
license=('MIT')
depends=('linux-hardened' 'bash' 'usbutils' 'coreutils' 'diffutils' 'procps-ng' 'grep' 'util-linux')
makedepends=('git')
provides=('usbctl')
conflicts=('usbctl')
source=(git+https://github.com/anthraxx/$_gitname.git)
sha512sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $_gitname
  install -Dm755 usbctl -t "$pkgdir/usr/bin"
  install -Dm644 contrib/systemd/deny-new-usb.service -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 contrib/completion/bash/usbctl -t "$pkgdir/usr/share/bash-completion/completions"
  install -Dm644 contrib/completion/zsh/_usbctl -t "$pkgdir/usr/share/zsh/site-functions"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
