# Maintainer: João Figueiredo <jf.mundox@gmail.com> (11/07/2020)
# Contributor: freggel.doe (Fixed i18n problem with make test,  13/07/2020)
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Jakob Matthes <jakob.matthes@gmail.com>
# Contributor: Bram Schoenmakers <me@bramschoenmakers.nl>
# Contributor: henning mueller <henning@orgizm.net>
# Contributor: rakoo (AUR)
# Contributor: SanskritFritz (gmail)

pkgname=bup
pkgver=0.31
pkgrel=2
pkgdesc='Efficient backup system based on the git packfile format'
arch=('x86_64')
url='https://bup.github.io/'
license=('GPL')
depends=('python-fuse' 'par2cmdline' 'python-pyxattr' 'acl' 'readline' 'attr' 'git')
optdepends=('python-tornado: for bup web')
makedepends=('pandoc')
#checkdepends=('rsync' 'python-tornado')
conflicts=('bup-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bup/bup/archive/${pkgver}.tar.gz"
        "argv.patch::https://github.com/bup/bup/commit/3a2a997771a1af6722059f15589fc15866d4bc54.patch")
sha256sums=('2f54351aed653b4b9567d3a534af598a5bc63b32efd7cc593bcecac3b89e16d1'
            '09b639aad2cd7e71c76b80011d566a9fad82e748eabf795fcdf2ec0ec3c28315')
changelog=changelog.md

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 < ../argv.patch
  #Backported patch for python 3.9 support: https://github.com/bup/bup/commit/3a2a997771a1af6722059f15589fc15866d4bc54
}

build() {
  cd "$pkgname-$pkgver"
  ./configure
  make
}

#check() {
#  cd "$pkgname-$pkgver"
#  LANG=C make test
#}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
