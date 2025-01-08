# Maintainer: solsTiCe d'Hiver <solstice.dhiver@gmail.com>

pkgname=atool2-git
_pkgname=atool
pkgver=r25.1db9e46
pkgrel=3
pkgdesc="A script for managing file archives of various types (with zstd support)"
arch=('any')
url="https://github.com/solsticedhiver/atool2"
license=('GPL-3.0-or-later')
depends=('file' 'perl')
makedepends=('bash')
conflicts=('atool')
provides=('atool')
optdepends=('bzip2: for using atool with bzip2 compressed archives'
            'cpio: for using atool with cpio archives'
            'gzip: for using atool with gzip compressed archives'
            'lha: for using atool with lha, lharc and similar archives'
            'xz: for using atool with lzma compressed archives'
            'lzop: for using atool with lzop compressed archives'
            'p7zip: for using atool with 7z archives'
            'tar: for using atool with tar archives'
            'unace: for using atool with ace archives'
            'unrar: for using atool with rar archives'
            'zip: for using atool for creating zip archives'
            'unzip: for using atool for unpacking archives'
            'zstd: for using atool with zstandard archives')
source=(atool::git+https://github.com/solsticedhiver/atool2.git)
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
}

prepare() {
  cd "${srcdir}"/${_pkgname}
  rm -rf build-aux
  autoreconf -i
}

build() {
  cd "${srcdir}"/${_pkgname}

  CONFIG_SHELL=/bin/bash ./configure --prefix=/usr --sysconfdir=/etc
}

package() {
  cd "${srcdir}"/${_pkgname}

  make DESTDIR="${pkgdir}" install
}
