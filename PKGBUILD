# Maintainer: Jorge Israel Peña <jorge.israel.p@gmail.com>

pkgname=syncplay-git
pkgver=v1.4.0.RC4.r17.gddae114
pkgrel=1
pkgdesc="synchronize watching movies on mplayer2, vlc, mpv, and mpc-hc on many computers"
arch=('any')
url="http://syncplay.pl/"
license=('custom')
depends=('python2' 'python2-pyside' 'python2-twisted')
makedepends=('git')
provides=('syncplay')
conflicts=('syncplay')
source=("$pkgname"::'git://github.com/Syncplay/syncplay.git'
        syncplay.service)
sha256sums=('SKIP'
            '7b0db4ec2731288084d788fc26e11b14166b6886f406b26e9e1c4e67ed9feb0f')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd $srcdir

  # systemd
  install -Dm644 syncplay.service ${pkgdir}/usr/lib/systemd/system/syncplay.service

  cd $pkgname

  # actual program
  make DESTDIR="$pkgdir" install
}
