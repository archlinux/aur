# Maintainer: aksr <aksr at t-com dot me>
pkgname=mblaze-git
pkgver=r401.cfec8ca
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
  for i in maddr magrep mcom mdeliver mdirs mflag mgenmid mhdr minc mless mlist mmime mpick mscan msed mseq mshow msort mthread; do
    install -Dm755 $i $pkgdir/usr/bin/$i 
    install -Dm644 man/${i}.1 $pkgdir/usr/share/man/man1/${i}.1
  done
  install -Dm755 mdate $pkgdir/usr/bin/mdate
  ln -sr $pkgdir/usr/bin/mcom $pkgdir/usr/bin/mrep
  install -Dm644 man/mrep.1 $pkgdir/usr/share/man/man1/mrep.1
  ln -sr $pkgdir/usr/bin/mless $pkgdir/usr/bin/mnext
  ln -sr $pkgdir/usr/bin/mless $pkgdir/usr/bin/mprev
  install -Dm755 mcolor $pkgdir/usr/bin/mcolor
  install -Dm755 mquote $pkgdir/usr/bin/mquote
  install -Dm644 man/mblaze.7 $pkgdir/usr/share/man/man7/mblaze.7
  install -m644 man/mmsg.7 $pkgdir/usr/share/man/man7/mmsg.7
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
  install -m644 filter.example $pkgdir/usr/share/doc/${pkgname%-*}/filter.example
  install -m644 mlesskey.example $pkgdir/usr/share/doc/${pkgname%-*}/mlesskey.example
  install -Dm644 COPYING $pkgdir/usr/share/licenses/${pkgname%-*}/COPYING
  for i in contrib/*; do
    install -Dm644 $i $pkgdir/usr/share/doc/${pkgname%-*}/$i 
  done
}

