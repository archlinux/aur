# Maintainer: kpcyrd <git@rxv.cc>

_gitname=usbctl
pkgname=usbctl-git
pkgver=1.0.r1.g7c5bf0e
pkgrel=1
pkgdesc="hardened linux deny_new_usb control"
url="https://github.com/anthraxx/usbctl"
depends=('bash' 'usbutils')
makedepends=('git')
arch=('any')
license=('MIT')
source=("git+https://github.com/anthraxx/$_gitname.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_gitname"

  install -Dm755 usbctl -t "$pkgdir/usr/bin"
  install -Dm644 contrib/systemd/deny-new-usb.service -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 contrib/completion/bash/usbctl -t "$pkgdir/usr/share/bash-completion/completions"
  install -Dm644 contrib/completion/zsh/_usbctl -t "$pkgdir/usr/share/zsh/site-functions"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
