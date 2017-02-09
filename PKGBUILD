# Maintainer: valvetime <valvetimepackages@gmail.com>
pkgname=telive
pkgver=d865b46
pkgrel=1
epoch=3
pkgdesc="application for monitoring and listening to TETRA voice channels"
arch=('any')
url="https://github.com/sq5bpf/telive"
license=('GPL')
groups=()
depends=('gnuradio' 'gnuradio-companion' 'python2' 'alsa-utils' 'vorbis-tools' 'sox')
makedepends=('git' 'patch')
optdepends=('google-earth: view SIP location reports on a map'
'osmo-tetra-sq5bpf-git: gnuradio based TETRA receiver')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(${pkgname}::"git+https://github.com/sq5bpf/telive")
noextract=()
md5sums=('SKIP')


build() {
  cd "$srcdir/$pkgname"
  make -j4
}


pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {

  cd "$srcdir/$pkgname"
  T=$pkgdir/tetra
  mkdir -p "$T/in" "$T/out" "$T/log" "$T/tmp" "$T/bin"
  cp bin/* $T/bin
  touch $T/log/telive.log
  cp -r $srcdir/telive $pkgdir/tetra
  #make /tetra writeable by users of group wheel
  chown  -R :wheel $pkgdir/tetra

}
