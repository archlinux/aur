# Maintainer : Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Jakob Matthes <jakob.matthes@gmail.com>
# Contributor: Bram Schoenmakers <me@bramschoenmakers.nl>
# Contributor: henning mueller <henning@orgizm.net>
# Contributor: rakoo (AUR)
# Contributor: SanskritFritz (gmail)

pkgname=bup
pkgver=0.30
pkgrel=2
pkgdesc='Efficient backup system based on the git packfile format'
arch=('x86_64')
url='https://bup.github.io/'
license=('GPL')
depends=('python2-fuse' 'par2cmdline' 'pylibacl' 'python2-pyxattr' 'git')
makedepends=('ruby-ronn' 'git' 'setconf' 'pandoc')
checkdepends=('rsync' 'python2-tornado')
optdepends=('python2-tornado: for bup web')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bup/bup/archive/${pkgver}.tar.gz")
sha512sums=('8c500568ca2609e6b437b3a67c08976bbdb6fbad39c77eb7e74e503b5ffdc1cbe1e51b5e834e7db0481a3cfc38a55aeae49a8e53657994524b612e54136e7af1')
changelog=changelog.md

build() {
  cd "${pkgname}-${pkgver}"
  ./configure
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  make test
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
