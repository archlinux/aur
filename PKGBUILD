# Maintainer: Martin C. Doege <mdoege at compuserve dot com>

pkgname=starplot
pkgver=0.95.5
pkgrel=5
pkgdesc="A 3-dimensional star chart viewer."
arch=('i686' 'x86_64')
url="http://starplot.org/"
license=('GPL')
depends=(gtk2)
optdepends=('starplot-yale5: star catalog'
            'starplot-gliese3: star catalog')
source=(http://starplot.org/downloads/$pkgname-$pkgver.tar.gz
        https://sources.debian.org/data/main/s/starplot/0.95.5-8.3/debian/patches/01-starplot_desktop_file.diff
        https://sources.debian.org/data/main/s/starplot/0.95.5-8.3/debian/patches/02-fix-ftbfs-and-hrdiagram-opts.diff
        https://sources.debian.org/data/main/s/starplot/0.95.5-8.3/debian/patches/03-fix-ftbfs-convert.diff
        https://sources.debian.org/data/main/s/starplot/0.95.5-8.3/debian/patches/04-fix-ftbfs-strings.diff
        https://sources.debian.org/data/main/s/starplot/0.95.5-8.3/debian/patches/05-startup-crash.diff)
md5sums=('ff51981f48240b234f24448510ed089c'
         '5a123dd5c959613a48807ea4a697e0e1'
         'bf1d9c5d09bb5b7e526b99fcb4288a3a'
         '429a6b08be6ae07c384c645a65cb35ad'
         '1c231005842d3f4e07bc41b96f1e433d'
         'e6cb0db621c878d70997c4d257c8f9c0')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -N -b -z .orig <../01-starplot_desktop_file.diff
  patch -p1 -N -b -z .orig <../02-fix-ftbfs-and-hrdiagram-opts.diff
  patch -p1 -N -b -z .orig <../03-fix-ftbfs-convert.diff
  patch -p1 -N -b -z .orig <../04-fix-ftbfs-strings.diff
  patch -p1 -N -b -z .orig <../05-startup-crash.diff
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
