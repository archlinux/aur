# Contributor: Sara <sara at archlinux dot us>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=cnoor-git
pkgver=r93.458780d
pkgrel=1
epoch=
pkgdesc="A simple framebuffer holy Quran viewer."
arch=('i686' 'x86_64')
url="http://litcave.rudi.ir/"
license=('GPL')
groups=()
depends=('')
makedepends=('git')
optdepends=()
optdepends=('ttf-sil-scheherazade: quran font'
            'ttf-dejavu: reader font')
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=$pkgname.install
source=("$pkgname::git+git://repo.or.cz/cnoor.git"
        'cnoor.1'
        'config.h'
        'http://tanzil.net/trans/en.ahmedali')
noextract=()
md5sums=('SKIP'
         'c5e914abff7843191998a5a3da0c386d'
         'ab0e8455b71c4042c8acbdbafba5d8e0'
         '4440b64e31448eee1e65f3ad09439dac')
sha1sums=('SKIP'
          '8a232ff84fe36112e0d58aa06f6978f63c81c1dc'
          '3ae09c097c17155be2ac80af24314f685bdd275a'
          '039ef775054904e89278a6d5f27ae04d80d41ffa')
sha256sums=('SKIP'
            'd87c5c5c4585f09f3af7a39e8ebb75f7b9a673e95966f56249b17cfcba1d6bba'
            '624cd5c1a4202695682ecccc338273d74d51029179319bc28ddbd7e9f76e4987'
            '4fdc3e02ab16c6f6d841416c4b86cc1ad950a2c0436f5c92637db67c813ed62d')

pkgver() {
  cd $srcdir/$pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$pkgname
  cp $srcdir/config.h config.h
  sed -i "10s|user|$HOME/.quran/quran-simple.txt|" config.h
}

build() {
  cd $srcdir/$pkgname
  make all
}

package() {
  cd $srcdir/$pkgname
  install -Dm755 cnoor $pkgdir/usr/bin/cnoor
  install -Dm755 README $pkgdir/usr/share/doc/${pkgname//-git/}/README
  install -Dm644 ../cnoor.1 $pkgdir/usr/share/man/man1/cnoor.1
  install -Dm644 ../en.ahmedali $pkgdir/usr/share/doc/cnoor/en.ahmedali
}

