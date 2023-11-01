# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=gnome-shell-extension-impatience-git
_pkgname=gnome-shell-impatience
pkgver=0.4.8.r4.g0f961b8
pkgrel=2
pkgdesc="speed up gnome-shell animations"
arch=('any')
url="https://github.com/timbertson/gnome-shell-impatience"
license=('GPL3')
depends=('gnome-shell>=1:45' 'gnome-shell<1:46')
makedepends=('git')
conflicts=('gnome-shell-extension-impatience')
provides=('gnome-shell-extension-impatience')
install=gschemas.install
source=(git+$url
        https://patch-diff.githubusercontent.com/raw/timbertson/gnome-shell-impatience/pull/33.diff)
sha256sums=('SKIP'
            'f604a5df06d1b215aa26858d268c1618accf70c05dc703296ab067502db6a7d7')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed -r 's/version-//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch --forward --strip=1 --input="$srcdir"/33.diff
}

package() {
  cd "$srcdir/$_pkgname/impatience"

  for i in $(find -type f); do
    install -Dm 644 $i $pkgdir/usr/share/gnome-shell/extensions/impatience@gfxmonk.net/$i
  done
}
