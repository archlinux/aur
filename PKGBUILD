# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
# Contributor: Thiago Yukio Kikuchi Oliveira <stratust@gmail.com>

pkgname=globus-toolkit
pkgver=6.0.1433516164
pkgrel=2
pkgdesc="Toolkit for building grids"
arch=('i686' 'x86_64')
url="http://toolkit.globus.org/"
license=('APACHE')
provides=("globus=$pkgver")
replaces=(globus)
conflicts=(globus)
source=(http://toolkit.globus.org/ftppub/gt6/installers/src/globus_toolkit-$pkgver.tar.gz
        globus.env.sh
        globus.sysusers)
sha1sums=('2f6c451664d01d238906519ca33a4b4d9fb1217d'
          'ad9c17923fb85224cb134beb79c04871c3a18307'
          '48e2f95145dfa27b0fee81022e33039e8524399c')
install="globus.install"

build() {
  cd "globus_toolkit-$pkgver"
  ./configure --prefix=/opt/globus
  make
}

package() {
  cd "globus_toolkit-$pkgver"
  make DESTDIR="$pkgdir" install

  cd "$srcdir"
  install -Dm 644 globus.env.sh "$pkgdir/etc/profile.d/globus.sh"
  install -Dm 644 globus.sysusers "$pkgdir/usr/lib/sysusers.d/globus.conf"
}

# vim: ft=sh:ts=2:sw=2:et
