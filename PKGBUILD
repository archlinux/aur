# Maintainer: Antoine Viallon <antoine@lesviallon.fr>

pkgname=spotrec-git
pkgver=v0.12.0.r2.g15c2e71
pkgrel=1
pkgdesc="Spotify desktop client recorder for PulseAudio (git version)"
arch=('any')
url="https://github.com/Bleuzen/SpotRec"
license=('mit')
depends=('python' 'python-dbus' 'ffmpeg' 'gawk' 'bash')
optdepends=('spotify'
            'audacity'
            'kid3')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')
provides=(spotrec)
conflicts=(spotrec)
makedepends=(nuitka)

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  ./build.sh
}

package() {
  mkdir -p "$pkgdir"/usr/bin/
  install -D $pkgname/spotrec "$pkgdir"/usr/bin/
}
