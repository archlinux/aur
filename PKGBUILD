# Maintainer: aksr <aksr at t-com dot me>
pkgname=santoku-git
pkgver=r292.a3f4227
pkgrel=1
epoch=
pkgdesc="Unix utilities to deal with Maildir"
arch=('i686' 'x86_64')
url="https://github.com/chneukirchen/santoku"
license=('publicdomain')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('santoku')
conflicts=('santoku')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/chneukirchen/santoku.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"

  for i in maddr mcomp mdeliver mdirs mflag mhdr minc mless mlist mmime mpick mscan mseq mshow msort mthread; do
    install -Dm755 $i $pkgdir/usr/bin/$i 
    install -Dm755 man/${i}.1 $pkgdir/usr/share/man/man1/${i}.1
  done
  ln -sr $pkgdir/usr/bin/mcomp $pkgdir/usr/bin/mrepl
  ln -sr $pkgdir/usr/bin/mless $pkgdir/usr/bin/mnext
  ln -sr $pkgdir/usr/bin/mless $pkgdir/usr/bin/mprev

  install -Dm755 man/mintro.7 $pkgdir/usr/share/man/man7/mintro.7
  install -m755 man/mmsg.7 $pkgdir/usr/share/man/man7/mmsg.7
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/COPYING
  install -Dm644 COPYING $pkgdir/usr/share/licenses/${pkgname%-*}/COPYING
}

