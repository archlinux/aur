# Maintainer: Ave Ozkal <aurpub@ave.zone>
# Contributor: Nikos Fytilis <n-fit@live.com>

_name=fusee-nano
pkgname="$_name-git"
pkgver=0.4.0.gdde2492
pkgrel=1
pkgdesc="A minimalist re-implementation of the Fusée Gelée exploit, designed to run on embedded Linux devices. "
arch=('any')
url="https://github.com/DavidBuchanan314/fusee-nano"
license=('mit')
makedepends=('git')
source=("$_name::git+https://github.com/DavidBuchanan314/fusee-nano"
'wrapper.sh')
md5sums=(SKIP
SKIP)

pkgver() {
  cd $_name
  git describe --long --tags | tr - .
}

build() {
  cd $_name
  make
}

package() {
  cd $_name
  mkdir -p $pkgdir/usr/share/$_name/{bin,share}
  mkdir -p $pkgdir/usr/bin
  cp -r files "$pkgdir/usr/share/$_name/share"
  install -m 755 fusee-nano "${pkgdir}/usr/share/$_name/bin/fusee-nano"
  install -m 755 $srcdir/wrapper.sh "${pkgdir}/usr/bin/fusee-nano"
}

