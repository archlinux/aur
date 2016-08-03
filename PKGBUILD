# Maintainer: aksr <aksr at t-com dot me>
pkgname=mblaze-git
pkgver=r356.688dd61
pkgrel=1
epoch=
pkgdesc="Unix utilities to deal with Maildir"
arch=('i686' 'x86_64')
url="https://github.com/chneukirchen/mblaze"
license=('publicdomain')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('mblaze')
conflicts=('mblaze' 'santoku')
replaces=('santoku-git')
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/chneukirchen/mblaze.git")
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
  for i in magrep maddr mcomp mdeliver mdirs mflag mhdr minc mless mlist mmime mpick mscan mseq mshow msort mthread; do
    install -Dm755 $i $pkgdir/usr/bin/$i 
    install -Dm755 man/${i}.1 $pkgdir/usr/share/man/man1/${i}.1
  done
  ln -sr $pkgdir/usr/bin/mcomp $pkgdir/usr/bin/mrepl
  ln -sr $pkgdir/usr/bin/mless $pkgdir/usr/bin/mnext
  ln -sr $pkgdir/usr/bin/mless $pkgdir/usr/bin/mprev
  install -Dm755 mcolor $pkgdir/usr/bin/mcolor
  install -Dm755 mquote $pkgdir/usr/bin/mquote
  install -Dm755 man/mblaze.7 $pkgdir/usr/share/man/man7/mblaze.7
  install -m755 man/mmsg.7 $pkgdir/usr/share/man/man7/mmsg.7
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
  install -m644 filter.example $pkgdir/usr/share/doc/${pkgname%-*}/filter.example
  install -m644 mlesskey.example $pkgdir/usr/share/doc/${pkgname%-*}/mlesskey.example
  install -Dm644 COPYING $pkgdir/usr/share/licenses/${pkgname%-*}/COPYING
  for i in contrib/*; do
    install -Dm644 $i $pkgdir/usr/share/doc/${pkgname%-*}/$i 
  done
}

