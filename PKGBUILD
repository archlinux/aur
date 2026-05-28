# Maintainer: Rod Kay   <charlie5 on #ada at irc.libera.chat>

pkgname=gnatsymbolize
pkgver=2020
pkgrel=2
pkgdesc='Translates addresses to filename, line number, and function name for Ada programs.'

arch=(x86_64 aarch64)
url='https://github.com/AdaCore'
license=(GPL-3.0-only)

depends=(gcc-ada)
makedepends=(gprbuild)

source=(https://community.download.adacore.com/v1/ebef002ce60066e3befdd1a4a0980f3ab8f1b551?filename=gnatsymbolize-2020-20200429-19987-src.tar.gz
        update_symbolic_traceback_call.patch)

sha256sums=(251471d621d9bc1fe391833df837914ceaa327200d4d879bff8bd1a6436b1ac8
            af656b6fc85b8cdb99cf32c08ab0bd50e6e31550e6e1e0a13f121dc88220e57e)

_pkg_src=gnatsymbolize-2020-20200429-19987-src


prepare()
{
   cd $srcdir/$_pkg_src

   patch -Np0 -i $srcdir/update_symbolic_traceback_call.patch
}


build()
{
   cd $srcdir/$_pkg_src

   gprbuild gnatsymbolize.adb
}


package()
{
   cd $srcdir/$_pkg_src

   install -D -m755 \
      gnatsymbolize  \
      $pkgdir/usr/bin/gnatsymbolize

   # Install the license.
   #
   install -D -m644 \
      COPYING3      \
      $pkgdir/usr/share/licenses/$pkgname/COPYING3
}
