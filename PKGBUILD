# Maintainer:  prettyvanilla <prettyvanilla@lavabit.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Charles Lindsay <charles@chaoslizard.org>

_pkgname=vhba-module
pkgname=vhba-module-lts318-ck
pkgver=20140928
pkgrel=1
pkgdesc="Kernel module that emulates SCSI devices. For linux-lts38-ck."
arch=('i686' 'x86_64')
url="http://cdemu.sourceforge.net/"
license=('GPL')
depends=('linux-lts318-ck>=3.18.0' 'linux-lts318-ck<3.19.0')
makedepends=('linux-lts318-ck-headers')
#provides=('vhba-module')
install=$pkgname.install
source=("http://downloads.sourceforge.net/cdemu/$_pkgname-$pkgver.tar.bz2"
        "60-vhba-lts318.rules")
md5sums=('967007230bb028424216d9b35da422c0'
         '4dc37dc348b5a2c83585829bde790dcc')

_extramodules=extramodules-3.18-lts318-ck

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  _kernver="$(cat /usr/lib/modules/$_extramodules/version)"

  make KDIR=/usr/lib/modules/$_kernver/build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm644 vhba.ko "$pkgdir/usr/lib/modules/$_extramodules/vhba.ko"
  install -Dm644 ../60-vhba-lts318.rules "$pkgdir/usr/lib/udev/rules.d/60-vhba-lts318.rules"
}
