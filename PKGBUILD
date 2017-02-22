# Maintainer: Gabriele Musco <emaildigabry@gmail.com>
# Upstream URL: https://github.com/gabmus/razercommander

pkgname=razercommander-git
pkgver=1.1.0.r3.g17407d6
pkgrel=1
pkgdesc='Razer device manager for Linux'
arch=('any')
url='https://github.com/gabmus/razercommander'
license=('GPL3')
depends=('python-razer' 'gtk3>=3.14' 'python')
makedepends=('git')
provides=('razercommander')
conflicts=('razercommander')
source=("razercommander::git+https://github.com/gabmus/razercommander")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/razercommander"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/razercommander"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/razercommander
  install -Dm644 razercommander.desktop.in $pkgdir/usr/share/applications/razercommander.desktop
  cp -r ./* $pkgdir/usr/share/razercommander/
  ln -s /usr/share/razercommander/main.py $pkgdir/usr/bin/razercommander
}
