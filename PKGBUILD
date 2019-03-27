# Maintainer: Tobias Kunze <r@rixx.de>
# Maintained at https://github.com/rixx/pkgbuilds, feel free to submit patches

pkgname=augenkrebs-git
pkgver=v0.3.r0.g7d54496
pkgrel=1
pkgdesc="Control VLC playback via a web interface. Internetabspielgerät @shackspace."
arch=('any')
url="http://github.com/shackspace/augenkrebs/"
license=('MIT')
groups=()
depends=('python' 'python-flask' 'vlc' 'ttf-freefont' 'chromium')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='augenkrebs.install'
source=("$pkgname"::'git://github.com/shackspace/augenkrebs.git')
noextract=()
md5sums=('SKIP') #generate with 'makepkg -g'

_gitroot='http://github.com/shackspace/augenkrebs.git'
_gitname='augenkrebs'

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"

  mkdir -p ${pkgdir}/usr/lib/
  cp -r augenkrebs "$pkgdir"/usr/lib/
  chmod -R a+rX "$pkgdir"/usr/lib/augenkrebs

  install -Dm644 install/augenkrebs.service "$pkgdir"/usr/lib/systemd/system/augenkrebs.service

  mkdir -p ${pkgdir}/usr/bin
  chmod +x ${pkgdir}/usr/lib/augenkrebs/augenkrebs.py
  ln -s /usr/lib/augenkrebs/augenkrebs.py ${pkgdir}/usr/bin/augenkrebs

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

# vim:set ts=2 sw=2 et:
