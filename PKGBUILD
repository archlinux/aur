# Maintainer: VerruckteFuchs <derverrucktefuchs@gmail.com>
# Original compton-git PKGBUILD and aur package maintained by WorMzy Tykashi <wormzy.tykashi@gmail.com>
pkgname=compton-garnetius-git
_gitname=compton
pkgver=0.1_beta2.88.ge5074a5
pkgrel=1
pkgdesc="garnetius' patched fork of compton with fixes for glx errors and Nvidia drivers"
arch=(i686 x86_64)
url="https://github.com/garnetius/compton"
license=('MIT')
depends=('libgl' 'libdbus' 'libxcomposite' 'libxdamage' 'libxrandr' 'pcre' 'libconfig' 'libxinerama' 'hicolor-icon-theme')
makedepends=('git' 'asciidoc' 'mesa')
optdepends=('dbus:          To control compton via D-Bus'
            'xorg-xwininfo: For compton-trans'
            'xorg-xprop:    For compton-trans')
provides=('compton')
conflicts=('compton')
source=("git://github.com/garnetius/compton.git")
md5sums=("SKIP")

pkgver() {
    cd "${srcdir}/${_gitname}"
    git describe --tags | sed -e 's:v::' -e 's/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  make PREFIX=/usr
  make docs
}

package() {
  cd "$srcdir/$_gitname"

  make PREFIX="$pkgdir/usr" install

  # install license
  install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$_gitname/LICENSE"

  # example conf
  install -D -m644 "compton.sample.conf" "$pkgdir/etc/xdg/compton.conf.example"
}
