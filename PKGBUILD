# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=raxml-mpi
pkgver=8.2.12
pkgrel=1
pkgdesc="Randomized Axelerated Maximum Likelihood"
arch=('x86_64')
url="http://sco.h-its.org/exelixis/web/software/raxml/"
license=('GPL3')
depends=('openmpi')
conflicts=(raxml)
provides=(raxml)
install='raxml.install'
source=("raxml-$pkgver.tar.gz::https://github.com/stamatak/standard-RAxML/archive/v$pkgver.tar.gz"
        'raxml.install')
sha256sums=('338f81b52b54e16090e193daf36c1d4baa9b902705cfdc7f4497e3e09718533b'
            '05283dec7f44c560590555b4f901e0c1ed422892471bddf651d90c94b41716ea')

build() {
  cd standard-RAxML-$pkgver

  for _f in Makefile*gcc ; do
    rm -f *.o
    make -f $_f || true
  done
}

package() {
  cd standard-RAxML-$pkgver

  for _f in raxml* ; do
    install -Dm755 $_f "$pkgdir"/usr/bin/$(basename $_f)
  done

  for _perlscript in usefulScripts/*.pl ; do
    install -Dm755 $_perlscript "$pkgdir"/usr/bin/$(basename $_perlscript .pl)
  done

  for _shellscript in usefulScripts/*.sh ; do
    install -Dm755 $_shellscript "$pkgdir"/usr/bin/$(basename $_shellscript .sh)
  done
}
