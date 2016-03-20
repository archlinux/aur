# Maintainer: Que Quotion ( quequotion at g mail dot com )

pkgname=makepkg-optimize
pkgver=1
pkgrel=1
pkgdesc='Additional package optimization routines for makepkg'
arch=('x86_64')
license=('GPL')
url='https://projects.archlinux.org/pacman.git/'
depends=('pacman' 'upx' 'optipng')
makedepends=('pacman')
source=('00.optipng.patch' '01.upx.patch' '02.lto.patch' '03.pgo.patch' '04.graphite.patch'
        'upx.sh' 'optipng.sh'
        'conf.pgo-lto.patch' 'conf.optipng-upx.patch' 'opticonf.patch'
        'makepkg' 'makepkg.conf')
sha512sums=('67fb9359cd5dc52413ad2ca7e91b445826d7cf6b7ad3db0d2b3845310ab0bdfc41c2e70cec564e26269521ac313f7202c44996a24266380e48e88927bd1012e2'
            'b4896082fd7fc4a69abc5fc98bf22c92a94cef9ccae5d3e5d1825cd3f04dcff1bce622a3f7fdc00bd43b5e1d091825d119b3a91d354f1ab58e6a8fe3af72b0e2'
            'e8d9112c8ff66136451d2746a91c2c43083541322ca5430a0bc6bf03e65ace5ff00296ffea4582075a325d02ddf1d880483025d1fcfba2ce749e12d6418b413b'
            'fa2a5aea8df56e0427c0fc37c7bb48ba4314176024177aebb8b890a415b23d7306a90f8987ab05e3b4f8e448ebf2475531970f7c161fe7088b37ac908b778850'
            '87fb65d5fb1d984b2f852d425bbe40a8eb9f487ebbe44dd7755acb705e731dd9e91f236c5c229c4feece9ecd1c081698518868909312480d22f8331d944d5d9f'
            'db55e9d4302035447854ec34d44d454a1a68882437129c00de388f56413cff71e133848df5a09962c40f2bd0203f5e5c692af4e100e67072da4b504ef4752ca4'
            '60ca209609ddbf617e63c7103d675da17671efc91db066a1e11dd1df78f9c8abf267f1cd417ff3b5db59411cf6e7df134e6bd8b06c73442410f14c13b1f5dd53'
            'de9fd2a9f394250e841a8e5228a180dad9e04aceb1427843056e6c4a4c6b066d36f607eb7493527258741c9521dcd58f3dd1e2191e5add5db0c871eee9e6e133'
            'cef2f8f3e82fa668c490f305bb01a344391958ca3f0be95da09e6008b30ecf996803dfda863a73e340c71937c7691d115bfe7e109c71d71eb65b5052bb179504'
            '16c2b0e666234f1a493e7456f4c387fbabd24b10514c93fa4338520e8f537e9a12de0d833a6148fe871452d87f6e1b3454b2bde332b9ba4c4e7680616b7eeede'
            '6df2ac2133f72ac2f3533fa9e3cc9337849dd5afbba2fd66b5d4d8b0b65a892c04771ceb6407eac357755fef87ac940d7848ccad915c387e465ad46b1ed496a3'
            '9e04d88c43cc25d21854ffc536cf9fd682d150fed08440a44a60b4e67285c28163cb069182355e718b2a6b6df8d536d8b32dcaac76f04d346cd658850b46769d')

prepare() {
  # Use the user's currently installed versions of both
  #cp /usr/bin/makepkg ./makepkg-optimize
  #cp /etc/makepkg.conf ./makepkg-optimize.conf

  # Replace with above after pacman update
  mkdir $pkgname
  cd $pkgname
  cp ../makepkg makepkg-optimize
  cp ../makepkg.conf makepkg-optimize.conf

  # Separate config file
  patch -Np0 < ../opticonf.patch
  patch -Np0 < ../conf.optipng-upx.patch
  patch -Np0 < ../conf.pgo-lto.patch

  # Add features in series
  patch -Np0 < ../00.optipng.patch
  patch -Np0 < ../01.upx.patch
  patch -Np0 < ../02.lto.patch
  patch -Np0 < ../03.pgo.patch
  patch -Np0 < ../04.graphite.patch
}

package() {
  cd $pkgname
  mkdir -p $pkgdir/usr/{bin,share/makepkg/tidy}/
  install -m755 makepkg-optimize $pkgdir/usr/bin/
  #Uncomment once dropped from pacman.
  #install -m755 ../optipng.sh $pkgdir/usr/share/makepkg/tidy/optipng.sh
  #install -m755 ../upx.sh $pkgdir/usr/share/makepkg/tidy/upx.sh
  mkdir -p $pkgdir/etc/
  install -m644 makepkg-optimize.conf $pkgdir/etc/
}
