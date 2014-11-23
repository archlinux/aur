# Maintainer: John K. Luebs <https://github.com/jkl1337>

# I maintain this on github, feel free to submit a pull request to
# https://github.com/jkl1337/packages-archlinux.git

pkgname=zasm
pkgver=3.0.22
pkgrel=1
pkgdesc="A 2-pass assembler for the Zilog 8-bit Z80 CPU"
arch=('i686' 'x86_64')
url="http://k1.spdns.de/Develop/Projects/zasm/"
license=('BSD')
groups=(devel)
source=(http://k1.spdns.de/Develop/Projects/zasm/Distributions/zasm-3.0.22-source-2014-02-12.zip
       Makefile.aur)
sha1sums=('74951569c783006cb2624b6bf8f1960e9be62cee'
          '10cda25f330fc20d91db3532cbc30322b183f494')

prepare () {
  cp -a Makefile.aur $pkgname/Makefile
}

build() {
  cd $pkgname

  cp -a config.h.LINUX config.h

  processor=_I386x64
  if [ "$CARCH" == 'i686' ]; then
      processor=_I386
  fi

  echo -e "#undef _I386\n#undef _I386x64\n#define $processor 1" >> config.h

  make
}

package() {
  cd $pkgname

  install -Dm755 zasm "${pkgdir}/usr/bin/zasm"
}

# vim:set ts=2 sw=2 et:
