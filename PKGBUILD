# Maintainer: Dominik Schrempf <dominik dot schrempf at gmail dot com>
pkgname=marvell-msu
pkgver=4.1.0.2032
pkgrel=3
pkgdesc="Marvell storage utility drivers and software for SATA controller 88SE9230 (e.g., HPE ProLiant MicroServer Gen10)"
arch=(x86_64)
url="https://www.marvell.com/storage/system-solutions/"
license=('unknown')
groups=()
depends=('openssl-1.0')
makedepends=('libarchive')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
# install=
# changelog=
source=("https://downloads.hpe.com/pub/softlib2/software1/pubsw-linux/p1857394694/v137000/Marvell_MSU_Linux_v4.1.0.2032.zip"
        "MSUAgent"
        "MSUStart"
        "MSUWebService")
md5sums=('57a924b3247d515f511531d25f2b8f1c'
         '5c0983eb5a3b278e08dbf2afcaaa7f36'
         '8f490aea6acffae5d91a638ebb04bf9d'
         '1c0fa07abb17110bd9daa3e72e4d5058')
noextract=()

build() {
  echo "Extracting RPM."
  rpmfldr=Marvell_MSU_Linux_v${pkgver}
  rpmfn=MSU-${pkgver}-1.${arch}.rpm
  bsdtar -xf $srcdir/$rpmfldr/$rpmfn
}

package() {
  # Scipts.
  install -D -m 755 MSUAgent $pkgdir/usr/bin/MSUAgent
  install -D -m 755 MSUStart $pkgdir/usr/bin/MSUStart
  install -D -m 755 MSUWebService $pkgdir/usr/bin/MSUWebService
  install -D -m 644 $srcdir/$rpmfldr/etc/marvell/cli/mvcli.ini $pkgdir/etc/marvell/cli/mvcli.ini
  install -D -m 755 $srcdir/$rpmfldr/lib64/libeventshare.so $pkgdir/usr/lib/libeventshare.so
  install -D -m 755 $srcdir/$rpmfldr/lib64/libmvraid.so $pkgdir/usr/lib/libmvraid.so
  # Too many files in the Marvell directory.
  cp -r $srcdir/$rpmfldr/opt $pkgdir/
  install -D -m 644 $srcdir/$rpmfldr/usr/share/applications/MSU.desktop $pkgdir/usr/share/applications/MSU.desktop
  install -D -m 644 $srcdir/$rpmfldr/usr/share/applications/MSUUninstall.desktop $pkgdir/usr/share/applications/MSUUninstall.desktop
}
