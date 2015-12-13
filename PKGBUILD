# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=devkitarm
pkgver=r45
pkgrel=1
pkgdesc="An ARM toolchain for GP32, Nintendo DS and GBA homebrew development"
arch=('i686' 'x86_64')
url="http://www.devkitpro.org"
license=('GPL')
options=(!strip libtool staticlibs emptydirs)
depends=('freeimage' 'python' 'flex' 'libmpc' 'libusb' 'guile')
install=devkitarm.install
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/buildscripts-20151213.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/binutils-2.25.1.tar.bz2"
        "http://mirrors.kernel.org/gnu/gcc/gcc-5.3.0/gcc-5.3.0.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/newlib-2.2.0.tar.gz"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/gdb-7.10.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/gbatools-1.0.0.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/gp32tools-1.0.1.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/dstools-1.0.2.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/grit-0.8.13.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/ndstool-1.50.3.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/general-tools-1.0.0.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/dlditool-1.24.0.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/mmutil-1.8.6.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/dfu-util-0.8.1.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/stlink-0.5.8.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/3dslink-0.5.1.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/3dstools-1.1.1.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/picasso-2.1.0.tar.bz2"
        "devkitarm-skip-libs.patch"
        "devkitarm.sh")
sha256sums=('dffe312bdcd86b30bbe91969fb82c8634b6e7171548c04ee8ebf52540de28818'
            'b5b14added7d78a8d1ca70b5cb75fef57ce2197264f4f5835326b0df22ac9f22'
            'b84f5592e9218b73dbae612b5253035a7b34a9a1f7688d2e1bfaaf7267d5c4db'
            'f8add263b0737591aff451b12a00c262c2efac4fa87d741fa1c318fc3bb335be'
            '06e9f1a56a993f759e63563cd293fd222a8c8e89b70074f1800f5e1976f93a40'
            '5e39c58f610410f19312d3fd4380418929912d2173dfa79fb7fe36a192988632'
            '6724bed8e8767956d571b0f334652bdfe07e52ab3dafe2a8292a1d6c4134f413'
            '96af20e6a352e741e8127579a6d64d10ff6d829dc757dfb157f7fb60c6d1abd2'
            '052d52082e9aed9c9e7e60870dcc024d5473e437a73fb5ef0329acf794f8a4e8'
            '674984065e3ab5f0321c024a5c88808c4f3651a9e054ddcb408121d93fcab862'
            '09474dfc1537e1008ee95b1a39a53715b8a740ee5ee37f4376607d6b110343c4'
            '5ecf67bcd5e2088ad31cd27fa14db575001388abc19510c4297aae42e9cd5d2f'
            '5b9182accb99abc03c1a31c39c003fbc5cb0d4af65a44102ede6098828cd045e'
            '2b56d91b86743f2ff09d818e0f2bd6704f154db5703b49c36b0a6d7da4e381e1'
            'f528cdaf328b74e1814e88f0fcbe04f4ee221d45c740dc1456de4e4036047bb9'
            '056bed0a85ad4d044f60a13752d721769fe0631cda0cc6d6831bf30e808f8e95'
            '6dbf15bb5cbeee826b6ffc608288f1267ed3696d725956943545c0572401d548'
            '79bf84b42da964918f6c8bb1294434ed1e10feab9a2b1f5a0183030637977650'
            '97b498aa26aba743e141115cd8f1169aa8411532f589c3c845233a299f5ecf74'
            'fc5489fab5ee4ce5cd53c2e1549fd2958872a6777324920b89e03b88584072db')
noextract=('binutils-2.25.1.tar.bz2' 'gcc-5.3.0.tar.bz2' 'newlib-2.2.0.tar.gz'
           'gdb-7.10.tar.bz2' 'gbatools-1.0.0.tar.bz2' 'gp32tools-1.0.1.tar.bz2'
           'dstools-1.0.2.tar.bz2' 'grit-0.8.13.tar.bz2' 'ndstool-1.50.3.tar.bz2'
           'general-tools-1.0.0.tar.bz2' 'dlditool-1.24.0.tar.bz2' 'mmutil-1.8.6.tar.bz2'
           'dfu-util-0.8.1.tar.bz2' 'stlink-0.5.8.tar.bz2' '3dslink-0.5.1.tar.bz2'
           '3dstools-1.1.1.tar.bz2' 'picasso-2.1.0.tar.bz2')

prepare() {
  # reset build dir
  rm -rf build

  # generate config file for automatic build
  cat << END > buildscripts/config.sh
#!bin/sh
BUILD_DKPRO_PACKAGE=1
BUILD_DKPRO_INSTALLDIR=$PWD/build
BUILD_DKPRO_SRCDIR=$PWD
BUILD_DKPRO_AUTOMATED=1
END

  # fix install of newlib, this is an arch specific bug, that also happens with
  # other arm cross toolchains + newlib. solution is to do the install again.
  sed 's/Error installing newlib"; exit 1; }/newlib, second try"; $MAKE install || { echo "& }/' \
    -i buildscripts/dkarm-eabi/scripts/build-gcc.sh

  # fix search path to use correct tools
  sed 's|$PATH:$TOOLPATH/$package/bin|$TOOLPATH/$package/bin:$PATH|' -i \
    buildscripts/build-devkit.sh

  # disable building of libraries, we have separate packages
  patch -Np0 < devkitarm-skip-libs.patch
}

build() {
  cd buildscripts

  # disable conflicting build flags
  unset CPPFLAGS
  ./build-devkit.sh
}

package() {
  install -d "$pkgdir"/opt/devkitpro
  cp -r build/devkitARM "$pkgdir"/opt/devkitpro
  # export environment variables
  install -Dm755 devkitarm.sh "$pkgdir"/etc/profile.d/devkitarm.sh
}
