# Maintainer: debpalash <4178343+debpalash@users.noreply.github.com>
pkgname=omarchy-bootable-git
_pkgname=omarchy-bootable
pkgver=r23.3fdd881
pkgrel=1
pkgdesc='Bootable boot media writer client for the Omarchy bar'
arch=('any')
url='https://github.com/debpalash/omarchy-bootable'
license=('MIT')
depends=('bootable>=0.1.4' 'bash')
optdepends=('bootable-gui: launch the desktop interface from the panel')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=omarchy-bootable.install
source=("$_pkgname::git+$url.git"
        'omarchy-bootable-setup'
        'omarchy-bootable.install')
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  local plugin="$pkgdir/usr/share/omarchy-bootable/plugin"
  install -d "$plugin"
  cp -a --no-preserve=ownership \
    Panel.qml Service.qml manifest.json LICENSE README.md \
    bootable-status bootable-download-session bootable-mark.svg bootable-app-mark.svg \
    "$plugin/"
  install -Dm755 "$srcdir/omarchy-bootable-setup" "$pkgdir/usr/bin/omarchy-bootable-setup"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
